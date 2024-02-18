import 'package:testproject/subway/exception/subway_error_message.dart';

class SubwayException implements Exception {
  final SubwayErrorMessage message;

  SubwayException(this.message);

  @override
  String toString() {
    return message.message;
  }
}