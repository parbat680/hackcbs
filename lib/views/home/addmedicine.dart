import 'dart:io';
import 'dart:developer';

import 'package:hackcbs/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import 'package:get/get.dart';
import 'package:hackcbs/utils/text_sizes.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final _formKey = GlobalKey<FormState>();

  File? _image;
  RxBool ispicked = false.obs;
  List<TimeOfDay> dosage_time = [];
  List days = [];
  String? name, dosage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoaderOverlay(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Row(
              children: [
                Expanded(
                  child: FastForm(
                    formKey: _formKey,
                    children: [
                      LabelText("addMedicine"),
                      FastTextField(
                        contentPadding: const EdgeInsets.all(15),
                        name: 'medicine_name',
                        labelText: 'medicineName',
                        placeholder: 'Medicine Name',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter medicine name";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          name = value;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FastTextField(
                        keyboardType: TextInputType.number,
                        contentPadding: const EdgeInsets.all(15),
                        name: 'medicine_duration',
                        labelText: 'duration',
                        placeholder: 'duration',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter medicine dosage";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          dosage = val;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FastChoiceChips(
                        name: 'choice_chips',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 4),
                        chipPadding: const EdgeInsets.all(8),
                        alignment: WrapAlignment.center,
                        onSaved: (value) {
                          days = value!;
                        },
                        chips: [
                          FastChoiceChip(
                            avatar: const Icon(Icons.calendar_view_week),
                            selected: false,
                            value: 'everyday',
                          ),
                          FastChoiceChip(
                            value: 'monday',
                          ),
                          FastChoiceChip(
                            selected: false,
                            value: 'tuesday',
                          ),
                          FastChoiceChip(
                            selected: false,
                            value: 'wednesday',
                          ),
                          FastChoiceChip(
                            selected: false,
                            value: 'thursday',
                          ),
                          FastChoiceChip(
                            selected: false,
                            value: 'friday',
                          ),
                          FastChoiceChip(
                            selected: false,
                            value: 'saturday',
                          ),
                          FastChoiceChip(
                            selected: false,
                            value: 'sunday',
                          ),
                        ],
                        validator: (value) => value == null || value.isEmpty
                            ? 'Please select at least one day'
                            : null,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FastTimePicker(
                        name: 'time',
                        labelText: 'dosageTime',
                        onChanged: (TimeOfDay? value) {
                          if (!dosage_time.contains(value)) {
                            dosage_time.add(value!);
                          }
                          setState(() {});
                        },
                        validator: (value) {
                          if (dosage_time.isEmpty) {
                            return "Selct atleast one slot";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Wrap(
                        spacing: 10,
                        children: dosage_time
                            .map((e) => Container(
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    margin: EdgeInsets.all(0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue.shade200,
                                    ),
                                    child: Text("12:00-1:00"),
                                  ),
                                ))
                            .toList(),
                      ),
                      LabelText("uploadImage"),
                      Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          margin: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromRGBO(0, 0, 0, 0),
                          ),
                          child: Container(
                              padding: const EdgeInsets.all(20),
                              height: 200,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  borderRadius: BorderRadius.circular(20)),
                              child: _image == null
                                  ? Center(
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.camera_alt,
                                          size: 30,
                                        ),
                                        onPressed: () {
                                          PopupSelector(context);
                                        },
                                      ),
                                    )
                                  : Image.file(
                                      _image!,
                                      fit: BoxFit.contain,
                                    ))),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate() &&
                              _image != null) {
                            _formKey.currentState!.save();
                            log("$name $dosage $dosage_time $days");
                            List time = [];
                            for (int i = 0; i < dosage_time.length; i++) {
                              time.add(
                                  "${dosage_time[i].hour}:${dosage_time[i].minute}");
                            }
                            context.loaderOverlay.show();
                            // try {
                            //   await MedicineHandler.addMedicines(name!, dosage!,
                            //       days.join(","), time.join(","), _image!);
                            // } catch (e) {
                            //   log(e.toString());
                            // }
                            // context.loaderOverlay.hide();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: Colors.green),
                        child: Text(
                          "Add Medicine",
                          style: poppinsFont.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w400),
                        ),
                      ).marginOnly(top: 10),
                    ],
                  ).marginSymmetric(horizontal: 20, vertical: 10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  LabelText(String label) {
    return Text(
      label,
      style: poppinsFont.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
    ).marginAll(20);
  }

  PopupSelector(context) {
    SingleImagePicker picker = SingleImagePicker();
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.image,
                  ),
                  title: const Text(
                    "Choose from gallery",
                    style: TextStyle(),
                  ),
                  onTap: () async {
                    Navigator.pop(context);
                    _image = await picker.galleryPick();
                    setState(() {});
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.camera_enhance_rounded,
                  ),
                  title: const Text("Choose from camera", style: TextStyle()),
                  onTap: () async {
                    Navigator.pop(context);
                    _image = await picker.cameraPick();
                    setState(() {});
                  },
                ),
              ],
            ),
          );
        });
  }
}
