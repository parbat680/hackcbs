import 'package:hackcbs/utils/text_sizes.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DoctorCard extends StatelessWidget {
  DoctorCard({Key? key, required this.onTap}) : super(key: key);

  VoidCallback onTap;
  RxBool isFav = false.obs;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: 200,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 5,
                spreadRadius: 3,
              )
            ]),
        child: Stack(children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Container(
                    alignment: Alignment.center,
                    // width: double.infinity,

                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: const AspectRatio(
                      aspectRatio: 9 / 11,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/doctor.jpg',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Dr. Akansha",
                    style:
                        headingBold.copyWith(fontSize: 16, color: Colors.black),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "\$",
                        style: headingBold.copyWith(
                            fontSize: 16, color: Colors.green),
                      ),
                      Text(
                        "25.00/ hour",
                        style: poppinsFont.copyWith(
                            fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    // addToFavourite();
                  },
                  splashRadius: 30,
                  icon: Obx(() => Icon(
                        Icons.favorite,
                        color: isFav.value ? Colors.red : Colors.grey,
                      ))),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  "⭐ 3.0",
                  style:
                      headingBold.copyWith(fontSize: 16, color: Colors.black),
                )),
          ),
        ]),
      ),
    );
  }

  // addToFavourite() async {
  //   ProductHandler ph = ProductHandler();

  //   try {
  //     if (product.isFavourite == true &&
  //         await ph.deleteFavourites(product.sId!)) {
  //       product.isFavourite = false;
  //       isFav.value = product.isFavourite!;
  //     } else if (await ph.addToFavourites(product.sId!)) {
  //       product.isFavourite = true;
  //       isFav.value = product.isFavourite!;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
}
