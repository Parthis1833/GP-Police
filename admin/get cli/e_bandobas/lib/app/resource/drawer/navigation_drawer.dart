import 'package:e_bandobas/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 216,
            child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(100, 28, 54, 105),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset('assets/images/logo.png',
                          width: 170, height: 125, fit: BoxFit.fill),
                    ),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
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
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -4),
            hoverColor: const Color.fromARGB(79, 126, 126, 190),
            leading: const Icon(
              Icons.app_registration,
            ),
            title: const Text(
              'એસેસર્સમેન્ટ',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.black87,
                fontSize: 16.0,
              ),
            ),
            onTap: () => navigate(0),
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -4),
            hoverColor: const Color.fromARGB(79, 126, 126, 190),
            leading: const Icon(
              Icons.data_usage_rounded,
            ),
            title: const Text(
              'કાઉન્ટર',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.black87,
                fontSize: 16.0,
              ),
            ),
            onTap: () => navigate(1),
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -4),
            hoverColor: const Color.fromARGB(79, 126, 126, 190),
            leading: const Icon(
              Icons.add_location_outlined,
            ),
            title: const Text(
              'ડ્યુટી પોઈન્ટ',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.black87,
                fontSize: 16.0,
              ),
            ),
            onTap: () => navigate(2),
          ),
          ExpansionTile(
            title: const Text("યાદી",style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.black87,
              fontSize: 16.0,
            ),),
            leading: const Icon(Icons.person), //add icon
            childrenPadding: const EdgeInsets.only(left: 60), //children padding
            children: [
              ListTile(
                title: const Text("ડ્યુટી પોઈન્ટ યાદી"),
                onTap: () => navigate(3),
              ),
              ListTile(
                title: const Text("ઝોન પોઈન્ટ યાદી"),
                onTap: () => navigate(4),
              ),

              //more child menu
            ],
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -4),
            hoverColor: const Color.fromARGB(79, 126, 126, 190),
            leading: const Icon(
              Icons.add_card_outlined,
            ),
            title: const Text(
              'ડ્યુટી પોઇન્ટ અલ્લોકાશન',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.black87,
                fontSize: 16.0,
              ),
            ),
            onTap: () => navigate(5),
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -4),
            hoverColor: const Color.fromARGB(79, 126, 126, 190),
            leading: const Icon(
              Icons.dashboard_customize,
            ),
            title: const Text(
              'અધિકારી ડેટા',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.black87,
                fontSize: 16.0,
              ),
            ),
            onTap: () => navigate(6),
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -4),
            hoverColor: const Color.fromARGB(79, 126, 126, 190),
            leading: const Icon(
              Icons.add_road_sharp,
            ),
            title: const Text(
              'રોડ બંદોબસ્ત ',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.black87,
                fontSize: 16.0,
              ),
            ),
            onTap: () => navigate(7),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                visualDensity: const VisualDensity(vertical: -4),
                hoverColor: const Color.fromARGB(79, 126, 126, 190),
                leading: const Icon(
                  Icons.settings,
                ),
                title: const Text(
                  'સેટટિંગ',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                    fontSize: 16.0,
                  ),
                ),
                onTap: () => navigate(8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  navigate(int index) {
    if (index == 0) {
      Get.toNamed(Routes.ASSESMENT);
    } else if (index == 1) {
      Get.toNamed(Routes.COUNTER);
    } else if (index == 2) {
      Get.toNamed(Routes.DUTYPOINT);
    } else if (index == 3) {
      Get.toNamed(Routes.POINTLIST);
    } else if (index == 4) {
      Get.toNamed(Routes.ZONELIST);
    } else if (index == 5) {
      Get.toNamed(Routes.DUTYPOINTALLOCATION);
    } else if (index == 6) {
      Get.toNamed(Routes.OFFICERDATA);
    } else if (index == 7) {
      Get.toNamed(Routes.ROADBANDOBAST);
    } else if (index == 8) {
      Get.toNamed(Routes.SETTING);
    }
  }
}
