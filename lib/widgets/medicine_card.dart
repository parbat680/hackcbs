import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:hackcbs/utils/text_sizes.dart';

class MedicineCard extends StatelessWidget {
  MedicineCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          constraints: BoxConstraints(minHeight: 120, maxHeight: 200),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 20,
                offset: Offset(0, 0),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Marijuana',
                    style: poppinsFont.copyWith(
                      color: Color(0xFF333333),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                ],
              ),
              Text(
                'After Breakfast, After Lunch',
                style: poppinsFont.copyWith(
                  color: Color(0xFF0EBE7F),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'Some description',
                style: poppinsFont.copyWith(
                  color: Color(0xFF677294),
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 12),
              Text(
                '15 days',
                style: poppinsFont.copyWith(
                  color: Color(0xFF0EBE7F),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  getDescription(BuildContext context) {
    RxBool showMore = false.obs;

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's...kkfekrlnflkernglenrg",
            style: poppinsFont.copyWith(fontSize: 14),
            maxLines: showMore.value ? 7 : 3,
            overflow: TextOverflow.ellipsis,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton.icon(
                onPressed: () {
                  showMore.value = !showMore.value;
                },
                icon: const Icon(Icons.arrow_drop_down),
                label: Text(
                  showMore.value ? "showLess" : "showMore",
                  style: poppinsFont.copyWith(color: Colors.blue),
                )),
          )
        ],
      ),
    );
  }
}
