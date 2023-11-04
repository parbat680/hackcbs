import 'package:flutter/material.dart';
import 'package:hackcbs/utils/text_sizes.dart';
import 'package:hackcbs/widgets/booking_number.dart';

class AppointmentLive extends StatefulWidget {
  const AppointmentLive({Key? key}) : super(key: key);

  @override
  State<AppointmentLive> createState() => _AppointmentLiveState();
}

class _AppointmentLiveState extends State<AppointmentLive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.0,
                ),

                SizedBox(
                  height: 20.0,
                ),
                //Current Token UI
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade500,
                              blurRadius: 10.0,
                              blurStyle: BlurStyle.outer),
                        ],
                      ),
                      child: Text(
                        "Current Token: ",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade500,
                              blurRadius: 10.0,
                              blurStyle: BlurStyle.outer),
                        ],
                      ),
                      child: Text(
                        "10",
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal),
                      ),
                    )
                  ],
                ),
                //Token List
                SizedBox(
                  height: 40.0,
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (BuildContext context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: LiveNumberCard(index: index),
                          );
                        }),
                  ),
                ),
                //Book Now Button
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50)),
                      child: Text("Book Now",
                          style: poppinsFont.copyWith(color: Colors.white))),
                ),
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
}
