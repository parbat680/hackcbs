import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import 'package:get/get.dart';
import 'package:hackcbs/repository/handlers/user_repo.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../utils/text_sizes.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _username = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  final TextEditingController _firstname = TextEditingController();

  final TextEditingController _lastname = TextEditingController();

  final TextEditingController _gender = TextEditingController();

  final TextEditingController _dob = TextEditingController();

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
                    "Sanjivani",
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
                    "Your go-to app for all your medical essentials.",
                    style: poppinsFont.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w200),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _firstname,
                        decoration: InputDecoration(
                          label: Text("firstname"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _lastname,
                        decoration: InputDecoration(
                          label: Text("lastname"),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _dob,
                        readOnly: true,
                        onTap: () async {
                          DateTime? dob = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );

                          _dob.text = DateFormat('dd-MM-yyyy').format(dob!);
                        },
                        decoration: InputDecoration(
                          label: Text("DOB"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: InputDecorator(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 4),
                            ),
                            child: DropdownButton<String>(
                              hint: Text("'select gender'"),
                              value: _gender.text == "" ? null : _gender.text,
                              items: <String>['Male', 'Female', 'Other']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                _gender.text = value!;
                                setState(() {});
                              },
                            ))),
                  ],
                ),
                SizedBox(
                  height: 10,
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
                SizedBox(
                  height: 10,
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
                SizedBox(
                  height: 10,
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
                  onPressed: () async {
                    UserRepository user = UserRepository();
                    bool auth = await user.signUp(
                        firstname: _firstname.text,
                        lastname: _lastname.text,
                        dob: _dob.text,
                        gender: _gender.text,
                        username: _username.text,
                        email: _email.text,
                        password: _password.text);

                    if (auth) {
                      Get.offAllNamed('/home');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    maximumSize: const Size(double.infinity, 50),
                  ),
                  child: Text(
                    "Sign Up",
                    style: poppinsFont.copyWith(color: Colors.white),
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
