import 'package:hackcbs/utils/text_sizes.dart';
import 'package:hackcbs/views/home/searchproducts.dart';
import 'package:hackcbs/views/home/time_slot_selection.dart';

import 'package:hackcbs/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> selectCat = [
    "Doctor",
    "Pharmacy",
    "Laboratory",
  ];

  RxInt selectIndex = 0.obs;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Welcome ",
                      style: headingBold.copyWith(color: Colors.white)),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      child: GestureDetector(
                        onTap: () {
                          showSearch(
                              context: context,
                              delegate: SearchProductDelegate());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                )
                              ]),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Search",
                                style: poppinsFont.copyWith(
                                    color: Colors.grey, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    // Expanded(
                    //     child: Container(
                    //   height: 50,
                    //   child: ElevatedButton(
                    //     onPressed: () {},
                    //     child: Icon(Icons.tune),
                    //     style: ElevatedButton.styleFrom(
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(10))),
                    //   ),
                    // ))
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: const BoxConstraints(
                  minHeight: 60,
                  maxHeight: 100,
                ),
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: selectCat.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Obx(
                            () => ChoiceChip(
                                label: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    selectCat[index],
                                    style: poppinsFont.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                onSelected: (val) {
                                  if (val) {
                                    selectIndex.value = index;
                                  }
                                },
                                selected:
                                    selectIndex.value == index ? true : false),
                          ));
                    })),
              ),
              Text("Nearby  ", style: headingBold),
              Container(
                constraints: const BoxConstraints(
                  minHeight: 280,
                  maxHeight: 300,
                ),
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return DoctorCard(
                        onTap: () {
                          Get.to(() => TimeSlotBooking());
                        },
                      );
                    })),
              ),
              Text("Popular  ", style: headingBold),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ]),
    ));
  }
}
