import 'package:e_bandobas/app/jsondata/EventData/Event.dart';
import 'package:e_bandobas/app/jsondata/EventData/EventApi.dart';
import 'package:e_bandobas/app/jsondata/PointData/Point.dart';
import 'package:e_bandobas/app/jsondata/PointData/PointApi.dart';
import 'package:e_bandobas/constants/enums.dart';
import 'package:get/get.dart';

class AssignedPoliceController extends GetxController {
  //TODO: Implement AssignedPoliceController

  late final selectedEventId = 0.obs;
  late final selectedPointId = 0.obs;
  final events = Rxn<List<Event>>();
  final points = Rxn<List<Point>>();


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;


  void loadPoints() async {
    print("done");
    points.value = await PointApi.obtainPoints(API_Decision.Only_Failure);
    if (points.value != null && points.value!.length > 0) {
      selectedPointId.value = points.value!.elementAt(0).id!.toInt();
    }

    print(points.value![0].zone);
    update();
  }


  void loadEvents() async {
    events.value = await EventApi.obtainEvents(API_Decision.Only_Failure);
    if (events.value != null && events.value!.length > 0) {
      selectedEventId.value = events.value!.elementAt(0).id!.toInt();
    }
    update();
  }
}
