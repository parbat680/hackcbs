import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackcbs/views/home/live_appointment.dart';

import '../../widgets/join_appointment.dart';

class TimeSlotBooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                docdetails(),
                Container(
                  margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade500,
                          blurRadius: 10.0,
                          blurStyle: BlurStyle.outer),
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: DatePicker(
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    daysCount: 7,
                    selectedTextColor: Colors.white,
                    selectionColor: Colors.green,
                  ),
                ),
                ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                          onTap: () {}, child: JoinAppointment());
                    }),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget docdetails() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleAvatar(
          radius: 40.0,
          backgroundColor: Colors.blue,
          backgroundImage: AssetImage("assets/doctor.jpg"),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dr. Parth",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal),
            ),
            LimitedBox(
              maxWidth: 220,
              child: Text(
                "I am a doctor-my motto is to provide healthy life for you",
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal),
              ),
            )
          ],
        )
      ],
    );
  }
}
