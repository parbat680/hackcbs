import 'package:flutter/material.dart';
import 'package:hackcbs/utils/text_sizes.dart';
import 'package:hackcbs/widgets/doctor_list_card.dart';

class DoctorListScreen extends StatefulWidget {
  const DoctorListScreen({Key? key}) : super(key: key);

  @override
  State<DoctorListScreen> createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "View Priscriptions",
                        style: headingBold,
                      ),
                      ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext, index) {
                            return GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => SlotTimeBook(
                                //               doc: snapshot.data![index],
                                //             )));
                              },
                              child: DoctorListCard(
                                  title: "Dr. Ankita",
                                  subtitle:
                                      "I am a doctor-my motto is to provide healthy life for you"),
                            );
                          }),
                      SizedBox(
                        height: 20.0,
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
