// write a code to make a priscription screen which contains a listview with priscriptioncard as the child

import 'package:flutter/material.dart';
import 'package:hackcbs/utils/text_sizes.dart';
import 'package:hackcbs/widgets/priscription_card.dart';

class PriscriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Prescriptions',
                style: headingBold,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return PriscriptionCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
