import 'package:hackcbs/utils/text_sizes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  RxBool showPass = false.obs;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
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
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Doctor Booking App",
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
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    child: TextFormField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: Text(
                          "Email",
                          style: poppinsFont,
                        ),
                      ),
                      validator: (val) {
                        if (!GetUtils.isEmail(val!.trim())) {
                          return "Enter valid email";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    child: Obx(
                      () => TextFormField(
                        controller: _password,
                        obscureText: !showPass.value,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            suffix: GestureDetector(
                              onTap: () {
                                showPass.value = !showPass.value;
                              },
                              child: Icon(
                                showPass.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ),
                            label: Text("password")),
                        style: poppinsFont,
                        validator: (val) {
                          if (val!.length < 6) {
                            return "password should be of minimum 6 characters";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        maximumSize: const Size(double.infinity, 50)),
                    child: Text(
                      "Login",
                      style: poppinsFont.copyWith(fontSize: 18),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: const Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "Forgot Password ?",
                        style: TextStyle(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                      text: TextSpan(
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    children: [
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: Text(
                            'Sign Up',
                            style: const TextStyle(),
                          ),
                        ),
                      )
                    ],
                    text: "need account ?",
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
