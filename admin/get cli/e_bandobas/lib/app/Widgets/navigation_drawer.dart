import 'package:e_bandobas/app/Config/routes/app_pages.dart';
import 'package:e_bandobas/app/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Navigation_Drawer extends StatelessWidget {
  const Navigation_Drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          buidDrawerHeader(),
          buildDrawerItem(
              text: 'એસેસર્સમેન્ટ',
              icon: Icons.app_registration,
              tileColor:
                  Get.currentRoute == Routes.ASSESMENT ? Colors.blue : null,
              textIconColor: Get.currentRoute == Routes.ASSESMENT
                  ? Colors.white
                  : Colors.black87,
              onTap: () => navigate(0)),
          buildDrawerItem(
            text: 'કાઉન્ટર',
            icon: Icons.data_usage_rounded,
            tileColor: Get.currentRoute == Routes.COUNTER ? Colors.blue : null,
            textIconColor: Get.currentRoute == Routes.COUNTER
                ? Colors.white
                : Colors.black87,
            onTap: () => navigate(1),
          ),
          buildDrawerItem(
            text: 'ડ્યુટી પોઈન્ટ',
            icon: Icons.add_location_outlined,
            tileColor:
                Get.currentRoute == Routes.DUTYPOINT ? Colors.blue : null,
            textIconColor: Get.currentRoute == Routes.DUTYPOINT
                ? Colors.white
                : Colors.black87,
            onTap: () => navigate(2),
          ),
          ExpansionTile(
            title: const Text(
              "યાદી",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.black87,
                fontSize: 16.0,
              ),
            ),
            leading: const Icon(Icons.person), //add icon
            childrenPadding: const EdgeInsets.only(left: 60), //children padding
            children: [
              ListTile(
                title: const Text(
                  "ડ્યુટી પોઈન્ટ યાદી",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                    fontSize: 16.0,
                  ),
                ),
                onTap: () => navigate(3),
              ),
              ListTile(
                title: const Text(
                  "ઝોન પોઈન્ટ યાદી",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                    fontSize: 16.0,
                  ),
                ),
                onTap: () => navigate(4),
              ),

              //more child menu
            ],
          ),
          buildDrawerItem(
            text: 'ડ્યુટી પોઇન્ટ અલ્લોકાશન',
            icon: Icons.add_card_outlined,
            tileColor: Get.currentRoute == Routes.DUTYPOINTALLOCATION
                ? Colors.blue
                : null,
            textIconColor: Get.currentRoute == Routes.DUTYPOINTALLOCATION
                ? Colors.white
                : Colors.black87,
            onTap: () => navigate(5),
          ),
          buildDrawerItem(
            text: 'અધિકારી ડેટા',
            icon: Icons.dashboard_customize,
            tileColor:
                Get.currentRoute == Routes.OFFICERDATA ? Colors.blue : null,
            textIconColor: Get.currentRoute == Routes.OFFICERDATA
                ? Colors.white
                : Colors.black87,
            onTap: () => navigate(6),
          ),
          buildDrawerItem(
            text: 'રોડ બંદોબસ્ત',
            icon: Icons.add_card_outlined,
            tileColor:
                Get.currentRoute == Routes.ROADBANDOBAST ? Colors.blue : null,
            textIconColor: Get.currentRoute == Routes.ROADBANDOBAST
                ? Colors.white
                : Colors.black87,
            onTap: () => navigate(7),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: buildDrawerItem(
                  text: 'સેટટિંગ',
                  icon: Icons.settings,
                  tileColor:
                      Get.currentRoute == Routes.SETTING ? Colors.blue : null,
                  textIconColor: Get.currentRoute == Routes.SETTING
                      ? Colors.white
                      : Colors.black87,
                  onTap: () => navigate(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buidDrawerHeader() {
    return SizedBox(
      height: 210,
      child: DrawerHeader(
          margin: const EdgeInsets.only(top: 0.5),
          decoration: const BoxDecoration(
            color: Color.fromARGB(100, 28, 54, 105),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/logo.png',
                    width: 170, height: 140, fit: BoxFit.fill),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'ઈ બંદોબસ્ત ',
                    style: TextStyle(
                      fontSize: 23.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget buildDrawerItem({
    required String text,
    required IconData icon,
    required Color textIconColor,
    required Color? tileColor,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ListTile(
        visualDensity: const VisualDensity(vertical: -2),
        hoverColor: const Color.fromARGB(79, 126, 126, 190),
        leading: Icon(icon, color: textIconColor),
        title: Text(
          text,
          style: TextStyle(
            color: textIconColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        tileColor: tileColor,
        onTap: onTap,
      ),
    );
  }

  navigate(int index) {
    if (index == 0) {
      // Get.toNamed(Routes.ASSESMENT);
      CustomRouteManager.ASSESMENT();
    } else if (index == 1) {
      // Get.toNamed(Routes.COUNTER);
      CustomRouteManager.COUNTER();
    } else if (index == 2) {
      // Get.toNamed(Routes.DUTYPOINT);
      CustomRouteManager.DUTYPOINT();
    } else if (index == 3) {
      // Get.toNamed(Routes.POINTLIST);
      CustomRouteManager.POINTLIST();
    } else if (index == 4) {
      // Get.toNamed(Routes.ZONELIST);
      CustomRouteManager.ZONELIST();
    } else if (index == 5) {
      // Get.toNamed(Routes.DUTYPOINTALLOCATION);
      CustomRouteManager.DUTYPOINTALLOCATION();
    } else if (index == 6) {
      // Get.toNamed(Routes.OFFICERDATA);
      CustomRouteManager.OFFICERDATA();
    } else if (index == 7) {
      // Get.toNamed(Routes.ROADBANDOBAST);
      CustomRouteManager.ROADBANDOBAST();
    } else if (index == 8) {
      // Get.toNamed(Routes.SETTING);
      CustomRouteManager.SETTING();
    }
  }
}
