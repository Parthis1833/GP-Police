import 'package:e_bandobas/app/resource/drawer/navigation_drawer.dart';
import 'package:e_bandobas/app/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navigation_Drawer(),
      appBar: AppBar(
        title: const Text('SettingView'),
        centerTitle: true,
      ),
      body:  Obx(() => (controller.events.value == null ||
          controller.passwordHistories.value == null)
          ? const CircularProgressIndicator()
          : SettingManagerWidget()),
    );
  }
  Widget drawer() {
    return SizedBox(
      width: 200.0,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const SizedBox(
              height: 65,
              child: DrawerHeader(
                child: Text('Setting',style: TextStyle(fontSize: 26),),
              ),
            ),
            ListTile(
              title: const Text('Add Police'),
              onTap:(){CustomRouteManager.POLICE_CREATE();},
            ),
            ListTile(
              title: const Text('Add Police-Station'),
              onTap: () {
                CustomRouteManager.POLICE_STATION();
              },
            ),
            ListTile(
              title: const Text(' Designation'),
              onTap: () {
                CustomRouteManager.DESIGNATION_VIEW();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget SettingManagerWidget() {
    return Row(
      children: [
        drawer(),
      GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Toggle Theme'),
          Switch(
            value: controller.darkTheme.value,
            onChanged: (value) {
              controller.toggleTheme();
              if (value) {
                // Set the app's theme to dark mode when the toggle switch is turned on
                Get.changeTheme(ThemeData.dark());
                // Set the background color to dark when the toggle switch is turned on
                SystemChrome.setSystemUIOverlayStyle(
                  const SystemUiOverlayStyle(
                    statusBarColor: Colors.black,
                    systemNavigationBarColor: Colors.black,
                  ),
                );
              } else {
                // Set the app's theme back to light mode when the toggle switch is turned off
                Get.changeTheme(ThemeData.light());
                // Set the background color back to light when the toggle switch is turned off
                SystemChrome.setSystemUIOverlayStyle(
                  const SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    systemNavigationBarColor: Colors.white,
                  ),
                );
              }
            },
          ),
        ],
      ),
    ),

    const Text('Password  management :-',style: TextStyle(
          fontSize: 21,
        ),),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  eventSelectionDropDownWidget(),
                  makePasswordWidgetButton(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: loadHistories(),
                  ),
                ],
              ),
            ],
          ),
        ),
       ),
      ),
      ],
    );
  }
Widget passwordMangement(){
    return Container();
}

  Widget makePasswordWidgetButton() {
    return SizedBox(
      width: 225,
      height: 50,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.green;
              }
              return Colors.blue;
            }),
            textStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return const TextStyle(fontSize: 40);
              }
              return const TextStyle(fontSize: 20);
            }),
          ),
          onPressed: () {
            controller.createPassword();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(
                Icons.add_circle_outline,
                color: Colors.deepPurple,
                size: 25,
              ),
              Text("Create passwords"),
            ],
          )),
    );
  }

  Widget eventSelectionDropDownWidget() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 160.0),
          height: 55,
          width: 250,
          child: const Text(
            'સોંપણીનું નામ  :-',
            style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 32.0),
          ),
        ),
        SizedBox(
          height: 55,
          width: 300,
          child: DropdownButton(
              hint: const Text("select event"),
              value: controller.selectedEventId.value == 0
                  ? null
                  : controller.selectedEventId.value,
              items: controller.events.value?.map((event) {
                return DropdownMenuItem(
                    value: event.id,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        event.eventName.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 26.0),
                      ),
                    ));
              }).toList(),
              onChanged: (value) {
                controller.changeSelectedEvent(value);
              }),
        ),
      ],
    );
  }

  Widget loadHistories() {
    return SizedBox(
      height: 250, // set the height to a fixed value
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          columns: const [
            DataColumn(label: Text("Event Name")),
            DataColumn(label: Text("User name"), numeric: false),
            DataColumn(label: Text("Phone Number"), numeric: false),
            DataColumn(label: Text("Ip of user"), numeric: false),
            DataColumn(label: Text("Access type of user"), numeric: false),
          ],
          rows: controller.passwordHistories.value!.histories!.map((history) {
            return DataRow(
              cells: [
                DataCell(Text(history.eventName ?? '')),
                DataCell(Text(history.userName ?? '')),
                DataCell(Text(history.phoneNumber ?? '')),
                DataCell(Text(history.ip ?? '')),
                DataCell(Text(history.accessType ?? '')),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}