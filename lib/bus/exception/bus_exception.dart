import 'package:testproject/bus/exception/bus_error_message.dart';

class BusException implements Exception {
  final BusErrorMessage busErrorMessage;

  const BusException(this.busErrorMessage);

  @override
  String toString() {
    return busErrorMessage.message;
  }
}