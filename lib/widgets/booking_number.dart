import 'package:flutter/material.dart';

//UI to show Tokens
class TokenInfo {
  String value, Status;

  TokenInfo({required this.Status, required this.value});

  static List<TokenInfo> tokens = [
    TokenInfo(Status: "completed", value: "Completed at 10 Am"),
    TokenInfo(Status: "completed", value: "Completed at 11 Am"),
    TokenInfo(Status: "ongoing", value: "Ongoing..."),
    TokenInfo(Status: "completed", value: "Completed at 10 Am"),
    TokenInfo(Status: "completed", value: "Completed at 11 Am"),
    TokenInfo(Status: "ongoing", value: "Ongoing..."),
  ];
}

class LiveNumberCard extends StatelessWidget {
  int index;
  LiveNumberCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: TokenInfo.tokens[index].Status == "completed"
                ? Colors.blue
                : Colors.green,
          ),
        ),
        child: Text(
          "1",
          style: TextStyle(
              color: TokenInfo.tokens[index].Status == "completed"
                  ? Colors.blue
                  : Colors.green,
              fontSize: 24,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal),
        ),
      ),
      title: Text(
        TokenInfo.tokens[index].value,
        style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 14,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal),
      ),
    );
  }
}
