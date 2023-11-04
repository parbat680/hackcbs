import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            // Top section with profile picture and name
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.green.shade300, Colors.green.shade600],
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 30.0, bottom: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 80.0,
                      backgroundColor: Colors.black38,
                      backgroundImage: AssetImage(
                        'assets/images/man-1276384_960_720.jpg',
                      ),
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
            // List of options
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () {
                      // Handle settings option
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.assignment),
                    title: const Text('Orders'),
                    onTap: () {
                      // Get.to(() => const OrderScreen());
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.star),
                    title: const Text('Rate us'),
                    onTap: () {
                      // Handle rate us option
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.exit_to_app),
                    title: const Text('Logout'),
                    onTap: () {
                      // _authBloc.add(Logout());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
