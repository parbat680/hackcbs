import 'package:flutter/material.dart';
import 'package:hackcbs/utils/text_sizes.dart';

class JoinAppointment extends StatelessWidget {
  const JoinAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      padding: const EdgeInsets.all(20.0),
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
      child: ListTile(
        title: Text(
          "10 AM - 12 PM",
          style: TextStyle(
              fontSize: 16,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Text("5/10 Slots Booked"),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade500,
                      blurRadius: 4.0,
                      blurStyle: BlurStyle.outer),
                ],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey.shade100,
                  value: 0.5,
                  minHeight: 9.0,
                  color: Colors.amber,
                ),
              ),
            ),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {},
          child: Text(
            "Book",
            style: poppinsFont.copyWith(color: Colors.white),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
