import 'package:flutter/material.dart';
import 'package:hackcbs/utils/text_sizes.dart';

class PriscriptionCard extends StatefulWidget {
  const PriscriptionCard({super.key});

  @override
  State<PriscriptionCard> createState() => _PriscriptionCardState();
}

class _PriscriptionCardState extends State<PriscriptionCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Date",
                    style: poppinsFont.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "12/10/23",
                    style: poppinsFont,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Time",
                    style: poppinsFont.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "4:00 pm - 4:30 pm",
                    style: poppinsFont,
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "view receipt",
                      style: poppinsFont.copyWith(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {},
                    child: Text(
                      "share receipt",
                      style: poppinsFont.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}
