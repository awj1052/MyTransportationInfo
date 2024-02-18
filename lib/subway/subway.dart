import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testproject/subway/exception/subway_error_message.dart';
import 'package:testproject/subway/exception/subway_exception.dart';

import 'enums/daejeonsubway.dart';
import 'enums/subwayudtype.dart';

class Subway {

  static const String baseUrl = "https://pts.map.naver.com/end-subway/api/realtime/subways?station=";

  static Future<String> getTime(DaejeonSubway daejeonSubway, SubwayUDType subwayUDType) async {
    List<dynamic> resData = await fetch(daejeonSubway, subwayUDType);

    var time = [];
    for(int i=0; i<resData[0][subwayUDType.key].length; i++) {
      var arrivalTime = DateTime.parse(resData[0][subwayUDType.key][i]["arrivalTime"]);
      int diffMin = arrivalTime.difference(DateTime.now()).inMinutes;
      time.add("$diffMin분 전");
    }

    if (time.isEmpty) time.add("운행 종료");
    return time.join(",  ");
  }

  static Future<List> fetch(DaejeonSubway daejeonSubway, SubwayUDType subwayUDType) async {
    final url = Uri.parse(baseUrl + daejeonSubway.station.toString());
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> resData = jsonDecode(response.body);
      return resData;
    }

    throw SubwayException(SubwayErrorMessage.notOK);
  }
}