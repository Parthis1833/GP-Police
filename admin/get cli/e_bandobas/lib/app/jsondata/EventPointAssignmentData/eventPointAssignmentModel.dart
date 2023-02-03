class EventPointAssignmentModel {
  EventPointAssignmentModel({this.eventId, this.pointId, this.assignmentCount});

  EventPointAssignmentModel.fromJson(dynamic json) {
    eventId = json['event-id'];
    pointId = json['point-id'];
    assignmentCount = json['assignment-count'];
    // assignedPoliceList = json['assigned-Police-list'];
    if (json['assigned-police-list'] != null) {
      assignedPoliceList = <Assignment>[];
      json['assigned-police-list'].forEach((assignment) {
        assignedPoliceList!.add(Assignment.fromJson(assignment));
      });
    }
  }
  num? eventId;
  num? pointId;
  num? assignmentCount;
  List<Assignment>? assignedPoliceList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['event-id'] = eventId;
    map['point-id'] = pointId;
    map['assignment-count'] = assignmentCount;
    // map['assigned-Police-list'] = assignedPoliceList;
    if (assignedPoliceList != null) {
      map['assigned-Police-list'] =
          assignedPoliceList!.map((a) => a.toJson()).toList();
    }
    return map;
  }
}

class Assignment {
  Assignment(
      {this.policeId,
      this.dutyStartDate,
      this.dutyEndDate,
      this.policeName,
      this.policeStationName,
      this.buckleNumber,
      this.gender,
      this.number,
      this.age,
      this.district});

  Assignment.fromJson(dynamic json) {
    policeId = json['police-id'];
    dutyStartDate = json['duty-start-date'];
    dutyEndDate = json['duty-end-date'];
    policeName = json['police-name'];
    policeStationName = json['police-station-name'];
    buckleNumber = json['buckle-number'];
    gender = json['gender'];
    number = json['number'];
    age = json['age'];
    district = json['district'];
  }
  num? policeId;
  String? dutyStartDate;
  String? dutyEndDate;
  String? policeName;
  String? policeStationName;
  String? buckleNumber;
  String? gender;
  String? number;
  String? age;
  String? district;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['police-id'] = policeId;
    map['duty-start-date'] = dutyStartDate;
    map['duty-end-date'] = dutyEndDate;
    map['police-name'] = policeName;
    map['police-station-name'] = policeStationName;
    map['buckle-number'] = buckleNumber;
    map['gender'] = gender;
    map['number'] = number;
    map['age'] = age;
    map['district'] = district;
    return map;
  }
}