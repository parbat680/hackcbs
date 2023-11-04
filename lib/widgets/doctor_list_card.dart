import 'package:flutter/material.dart';

class DoctorListCard extends StatelessWidget {
  String title, subtitle;
  DoctorListCard({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Color.fromRGBO(158, 158, 158, 1),
              blurRadius: 5.0,
              spreadRadius: 3,
              blurStyle: BlurStyle.outer),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: SizedBox(
          width: 50,
          height: 50,
          child: const CircleAvatar(
            radius: 20.0,
            backgroundColor: Colors.blue,
            backgroundImage: AssetImage("assets/doctor.jpg"),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
              fontSize: 16,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
              fontSize: 12,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal),
        ),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
