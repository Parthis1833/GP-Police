import 'dart:convert';

import 'package:e_bandobas/app/jsondata/DesignationData/Designation.dart';
import 'package:e_bandobas/app/jsondata/DesignationData/DesignationApi.dart';
import 'package:e_bandobas/app/jsondata/EventData/Event.dart';
import 'package:e_bandobas/app/jsondata/EventData/EventApi.dart';
import 'package:e_bandobas/app/jsondata/EventPoliceCount/EventPolceCountModel.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssesmentCreateController extends GetxController {
  //TODO: Implement AssesmentCreateController

  var designationTextEditingControllers = <TextEditingController>[];
  late final selectedEventId = 0.obs;
  final designations = Rxn<List<Designation>>();
  final events = Rxn<List<Event>>();

  // reactive variables, which can affect UI
  final isDesignationLoading = true.obs;
  final isEventLoading = true.obs;

  void loadDesignations() async {
    designations.value =
        await DesignationApi.obtainDesignations(API_Decision.Only_Failure);
    isDesignationLoading.value = false;
    if (designations.value != null) {
      for (var i in designations.value!) {
        var textEditingController = TextEditingController(text: "");
        designationTextEditingControllers.add(textEditingController);
        // return textFields.add(new TextField(controller: textEditingController));
      }
    }
    update();
  }

  void loadEvents() async {
    events.value = await EventApi.obtainEvents(API_Decision.Only_Failure);
    if (events.value != null && events.value!.length > 0) {
      selectedEventId.value = events.value!.elementAt(0).id!.toInt();
    }
    update();
  }

  void saveEventAssignment() {
    Map<String, String> designationsData = {};

    for (int i = 0; i < designations.value!.length; i++) {
      if (designationTextEditingControllers[i].text.isNotEmpty &&
          int.parse(designationTextEditingControllers[i].text) > 0) {
        designationsData[designations.value![i].id.toString()] =
            designationTextEditingControllers[i].text;
      }
    }
    Map eventPoliceCountData = {
      "event-id": selectedEventId.value,
      "designations": designationsData
    };
    print(eventPoliceCountData);
    EventPoliceCountModel e = EventPoliceCountModel(
        eventId: selectedEventId.value, designations: designationsData);
    print(e.eventId);
    print(e.designations);
    // print()
  }

  @override
  void onInit() {
    super.onInit();
    loadDesignations();
    loadEvents();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeSelectedEvent(num? value) {
    selectedEventId.value = value!.toInt();
    update();
  }

  // void increment() => count.value++;
}