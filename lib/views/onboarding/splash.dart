
import 'package:flutter/material.dart';

import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    timer();
    super.initState();
  }

  timer() async {
    Future.delayed(const Duration(seconds: 5))
        .then((value) => Get.offAllNamed('/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 251, 253, 1),
      body: Center(
        child: Image.asset("assets/images/ezgif.com-video-to-gif.gif"),
      ),
    );
  }
}
