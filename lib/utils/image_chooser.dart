import 'dart:developer';
import 'dart:io';

import 'package:hackcbs/utils/text_sizes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageChooser {
  File? _image;
  late Function(String v, File f) callback;

  PopupSelector(context, Function(String v, File f) callback) {
    this.callback = callback;

    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: [
                ListTile(
                  tileColor: Theme.of(context).cardColor,
                  leading: const Icon(
                    Icons.image,
                  ),
                  title: Text(
                    "Choose from gallery",
                    style: poppinsFont,
                  ),
                  onTap: () async {
                    Navigator.pop(context);
                    await _galleryPick();
                  },
                ),
                ListTile(
                  tileColor: Theme.of(context).cardColor,
                  leading: const Icon(
                    Icons.camera_enhance_rounded,
                  ),
                  title: Text("Choose from camera", style: poppinsFont),
                  onTap: () async {
                    Navigator.pop(context);
                    await _cameraPick();
                  },
                ),
              ],
            ),
          );
        });
  }

  _cameraPick() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.camera);

    if (picked != null) {
      _image = File(picked.path);
      log(picked.path);
    }
    return true;
  }

  _galleryPick() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      _image = File(picked.path);
      log(picked.path);
    }
  }
}
