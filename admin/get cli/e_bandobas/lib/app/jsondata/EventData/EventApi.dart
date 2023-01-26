
import 'dart:html';

import 'package:e_bandobas/app/Api/API.dart';
import 'package:e_bandobas/app/jsondata/EventData/Event.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EventApi {
  static Future<List<Event>> obtainEvents(API_Decision showStatus) async {
    List<Event> events = <Event>[];
    final response = await http.get(
      Uri.parse(APIConstants.EVENT_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);

      if (responseJson['response']['error'] == 0) {
        if (showStatus == API_Decision.Only_Success) {
          Get.snackbar(
            "Success",
            "Event Obtained successfully",
            icon: Icon(Icons.add_task_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        }
        for (int i = 0; i < responseJson['content'].length; i++) {
          Event event = Event.fromJson(responseJson['content'][i]);
          events.add(event);
        }
      } // api error to be displayed
      else {
        if (showStatus == API_Decision.Only_Failure) {
          Get.snackbar(
            "Failed",
            responseJson['response']['message'],
            icon: Icon(Icons.cancel_presentation_sharp, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
          );
        }
      }
    }
    return events;
  }
  
}