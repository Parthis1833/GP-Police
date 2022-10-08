import 'package:e_bandobas1/Resources/Card/PoliceCard.dart';
import 'package:e_bandobas1/Resources/drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/assessment_controller.dart';

class RoadBandobastView extends GetView<AssessmentController> {
  const RoadBandobastView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(100, 28, 54, 105),
        title: const Text('Road Bandobast '),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.zero,
        color: const Color.fromARGB(88, 73, 89, 110),
        child: PolicCard(
          margin: const EdgeInsets.all(8),
          color: Colors.grey,
          child: const Align(
            child: Text(''),
          ),
        ),
      ),
    );
  }
}
