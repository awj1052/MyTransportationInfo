import 'package:http/http.dart' as http;
import 'package:testproject/bus/exception/bus_error_message.dart';
import 'package:testproject/bus/exception/bus_exception.dart';
import 'package:testproject/bus/wrapper/busroute_no.dart';
import 'package:testproject/bus/wrapper/busstop_id.dart';

class Bus {

  static const String baseUrl = "https://m.map.kakao.com/actions/busStationInfo?busStopId=";
  static const int trustableLen = 400;

  static Future<String> getTime(BusStopId busStopId, BusRouteNo busRouteNo) async {
    final response = await _fetch(busStopId);
    final start = response.indexOf('tit_g">${busRouteNo.number}</');
    if (start == -1) throw BusException(BusErrorMessage.notOK);

    var data = [];
    final firstData = _getData(response, start);
    final firstDataStr = _formatData(firstData['data'].toString());
    data.add(firstDataStr);
    if (!firstDataStr.contains("정보없음") && !firstDataStr.contains("회차대기 지연")) {
      final secondData = _getData(response, firstData['last']);
      data.add(_formatData(secondData['data'].toString()));
    }

    return data.join(",  ");
  }

  static String _formatData(String data) {
    return data.replaceAll("\n", "").replaceFirst("			", "");
  }

  static Future<String> _fetch(BusStopId busStopId) async {
    final url = Uri.parse(baseUrl + busStopId.id.toString());
    final response = await http.read(url);
    return response;
  }

  static Map<String, dynamic> _getData(String response, int start) {
    final firstMark = response.indexOf('txt_situation', start);
    if (!_isTrustable(firstMark - start)) {
      return {
        'data': '정보없음',
        'last': firstMark
      };
    }
    final secondMark = response.indexOf('">', firstMark);
    final thirdMark = response.indexOf("</span>", secondMark);
    return {
      'data': response.substring(secondMark + 2, thirdMark),
      'last': thirdMark
    };
  }

  static bool _isTrustable(int diff) {
    return diff < trustableLen;
  }
}