class APIConstants {
  static const BASE_URL = "http://localhost:8080";

  // POLICE APIS
  static const POLICE = "/police/";
  static const POLICE_URL = BASE_URL + POLICE; // FOR GET REQUEST
  static const POLICE_URL_CREATE = BASE_URL + POLICE; // FOR POST REQUEST
  static const POLICE_URL_UPDATE =
      BASE_URL + POLICE; // NEED TO APPEND POLICE ID
  static const POLICE_URL_DELETE =
      BASE_URL + POLICE; // NEED TO APPEND POLICE ID
  static const POLICE_URL_UPLOAD_FROM_EXCEL =
      BASE_URL + POLICE + "upload-from-excel"; // FOR POST REQUEST
  static const POLICE_READ_SPECIFIC =
      BASE_URL + POLICE; // NEED TO APPEND POLICE ID
  static const POLICE_OFFICER_DATA =
      BASE_URL + POLICE + "officer-data"; // FOR GET REQ

  // POLICE STATIONS APIS
  static const POLICESTATION = "/police-station/";
  static const POLICESTATION_URL = BASE_URL + POLICESTATION; //
  static const POLICESTATION_URL_CREATE =
      BASE_URL + POLICESTATION; // for post request
  static const POLICESTATION_URL_UPDATE =
      BASE_URL + POLICESTATION; // need to append id with put req
  static const POLICESTATION_URL_DELETE =
      BASE_URL + POLICESTATION; // append id with del req
  static const POLICESTATION_URL_UPLOAD_FROM_EXCEL =
      BASE_URL + POLICESTATION + "upload-from-excel"; // get req
  static const POLICESTATION_READ_SPECIFIC =
      BASE_URL + POLICESTATION; // append id

  // POINT APIS
  static const POINT = "/point/";
  static const POINT_URL = BASE_URL + POINT; // FOR GET REQUEST
  static const POINT_URL_CREATE = BASE_URL + POINT; // FOR POST REQUEST
  static const POINT_URL_UPDATE =
      BASE_URL + POINT; // NEED TO Append id with put req
  static const POINT_URL_DELETE =
      BASE_URL + POINT; // NEED TO Append id with del req
  // static const POINT_URL_UPLOAD_FROM_EXCEL =
  static const POINT_READ_SPECIFIC =
      BASE_URL + POINT; // Need to Append id with get req

  // EVENT APIS
  static const EVENT = "/event/";
  static const EVENT_URL = BASE_URL + EVENT; // FOR GET REQUEST
  static const EVENT_URL_CREATE = BASE_URL + EVENT; // FOR POST REQUEST
  static const EVENT_URL_UPDATE = BASE_URL + EVENT; // NEED TO Append
  static const EVENT_URL_DELETE = BASE_URL + EVENT; // NEED TO Append
  // static const EVENT_URL_UPLOAD_FROM_EXCEL = BASE_URL + EVENT;
  static const EVENT_READ_SPECIFIC =
      BASE_URL + EVENT; // need to append id with get req

  // DESIGNATAION APIS
  static const DESIGNATION = "/designation/";
  static const DESIGNATION_URL = BASE_URL + DESIGNATION; // FOR GET
  static const DESIGNATION_URL_CREATE = BASE_URL + DESIGNATION; // for post req
  static const DESIGNATION_URL_UPDATE =
      BASE_URL + DESIGNATION; // need to append id with put req
  static const DESIGNATION_URL_DELETE =
      BASE_URL + DESIGNATION; // need to append id with delete
  // static const DESIGNATION_URL_UPLOAD_FROM_EXCEL = BASE_URL + DESIGNATION;
  static const DESIGNATION_READ_SPECIFIC =
      BASE_URL + DESIGNATION; // need to append id with get req
  static const DESIGNATION_FIND_BY =
      BASE_URL + DESIGNATION + "find-by"; // get req

  // ASSIGN POLICE
  static const ASSIGNPOLICE = "/assign-police/";
  static const ASSIGNPOLICE_URL = BASE_URL + ASSIGNPOLICE; //
  static const ASSIGNPOLICE_URL_CREATE = BASE_URL + ASSIGNPOLICE; // post req
  static const ASSIGNPOLICE_URL_CREATE_V2 =
      BASE_URL + ASSIGNPOLICE; // post Req,
  static const ASSIGNPOLICE_URL_UPDATE =
      BASE_URL + ASSIGNPOLICE; // append id for put req
  static const ASSIGNPOLICE_URL_DELETE =
      BASE_URL + ASSIGNPOLICE; // append id for delete req
  // static const ASSIGNPOLICE_URL_UPLOAD_FROM_EXCEL = BASE_URL + ASSIGNPOLICE; // append id for
  static const ASSIGNPOLICE_READ_SPECIFIC =
      BASE_URL + ASSIGNPOLICE; // append if for get req
  static const ASSIGNPOLICE_COUNT_IN_EVENT = BASE_URL + ASSIGNPOLICE + "count-police-in-event";
  static const ASSIGNPOLICE_COUNT_IN_POINT_AND_EVENT = BASE_URL + ASSIGNPOLICE + "count-police-in-point-event";

}

// class Police extends APIConstants {
//   static const POLICE_URL = APIConstants.BASE_URL + "/police";
// }
