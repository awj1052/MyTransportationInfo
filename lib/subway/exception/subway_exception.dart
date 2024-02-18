import 'package:testproject/subway/exception/subway_error_message.dart';

class SubwayException implements Exception {
  final SubwayErrorMessage subwayErrorMessage;

  SubwayException(this.subwayErrorMessage);

  @override
  String toString() {
    return subwayErrorMessage.message;
  }
}