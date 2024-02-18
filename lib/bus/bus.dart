import 'package:http/http.dart' as http;
import 'package:testproject/bus/exception/bus_error_message.dart';
import 'package:testproject/bus/exception/bus_exception.dart';
import 'package:testproject/bus/wrapper/busroute_no.dart';
import 'package:testproject/bus/wrapper/busstop_id.dart';

class Bus {

  static const String baseUrl = "https://m.map.kakao.com/actions/busStationInfo?busStopId=";

  static Future<String> getTime(BusStopId busStopId, BusRouteNo busRouteNo) async {
    final response = await fetch(busStopId);
    final start = response.indexOf('tit_g">${busRouteNo.number}</');
    if (start == -1) throw BusException(BusErrorMessage.notOK);

    var data = [];
    final firstData = getData(response, start);
    data.add(firstData['data'].toString().replaceAll("\n", "").replaceFirst("			", ""));
    if (firstData['data'] != "정보없음" && firstData['data'] != "회차대기 지연") {
      final secondData = getData(response, firstData['last']);
      data.add(secondData['data'].toString().replaceAll("\n", "").replaceFirst("			", ""));
    }

    return data.join(",  ");
  }

  static Future<String> fetch(BusStopId busStopId) async {
    final url = Uri.parse(baseUrl + busStopId.id.toString());
    final response = await http.read(url);
    return response;
  }

  static Map<String, dynamic> getData(String response, int start) {
    final firstMark = response.indexOf('txt_situation', start);
    final secondMark = response.indexOf('">', firstMark);
    final thirdMark = response.indexOf("</span>", secondMark);
    return {
      'data': response.substring(secondMark + 2, thirdMark),
      'last': thirdMark
    };
  }
}