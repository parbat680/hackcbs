import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../utils/text_sizes.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final RxBool _showPass = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LoaderOverlay(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Align(
                //   alignment: Alignment.topRight,
                //   child: SizedBox(
                //     width: MediaQuery.of(context).size.width * 0.6,
                //     height: MediaQuery.of(context).size.height * 0.27,
                //     child: Image.asset(
                //       'assets/images/loginpagedesign.png',
                //       fit: BoxFit.fill,
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Doctor Booking app",
                    style: headingBold.copyWith(
                        fontSize: 26, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Your go-to app for all your gardening essentials.",
                    style: poppinsFont.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w200),
                  ),
                ),

                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _username,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.account_circle,
                      size: 20,
                    ),
                    label: Text("username"),
                  ),
                ),

                TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      size: 20,
                    ),
                    label: Text("Email"),
                  ),
                ),
                Obx(
                  () => TextFormField(
                    controller: _password,
                    obscureText: !_showPass.value,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.password,
                        size: 20,
                      ),
                      suffix: GestureDetector(
                        onTap: () {
                          _showPass.value = !_showPass.value;
                        },
                        child: Icon(
                          _showPass.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                      label: Text("password"),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                ElevatedButton(
                  onPressed: () async {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    maximumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
