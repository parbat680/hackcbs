import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:hackcbs/views/home/doctor_list.dart';

import 'package:hackcbs/views/home/home.dart';
import 'package:hackcbs/views/home/medication.dart';

import 'package:hackcbs/views/home/profile.dart';
import 'package:flutter/material.dart';
import 'package:hackcbs/widgets/doctor_list_card.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({super.key});

  @override
  HomeTabPageState createState() => HomeTabPageState();
}

class HomeTabPageState extends State<HomeTabPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          const HomePage(),
          const DoctorListScreen(),
          const MedicationScreen(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.green,
        controller: _tabController,
        style: TabStyle.react,
        items: [
          TabItem(icon: Icons.home),
          TabItem(icon: Icons.edit_note),
          TabItem(icon: Icons.medication_outlined),
          TabItem(icon: Icons.person),
        ],
        initialActiveIndex: 1,
      ),
    );
  }
}
