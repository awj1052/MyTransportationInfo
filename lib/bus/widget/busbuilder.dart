import 'package:flutter/material.dart';
import 'package:testproject/my_listtile.dart';

import '../bus.dart';
import '../wrapper/busroute_no.dart';
import '../wrapper/busstop_id.dart';

class BusBuilder extends StatefulWidget {
  final BusStopId busStopId;
  final BusRouteNo busRouteNo;
  final String busStopName;

  const BusBuilder({super.key, required this.busStopId, required this.busRouteNo, required this.busStopName});

  @override
  State<BusBuilder> createState() => _BusBuilderState();
}

class _BusBuilderState extends State<BusBuilder> {
  @override
  Widget build(BuildContext context) {
    final BusStopId busStopId = widget.busStopId;
    final BusRouteNo busRouteNo = widget.busRouteNo;
    final String busStopName = widget.busStopName;

    return FutureBuilder(
      future: Bus.getTime(busStopId, busRouteNo),
      builder: (context, snapshot) {
        if (snapshot.hasData == false) {
          return MyListTile(leading: busRouteNo.number.toString(), title: busStopName, subtitle: "");
        } else if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              'Error: ${snapshot.error}',
              style: TextStyle(fontSize: 15),
            ),
          );
        }
        return MyListTile(leading: busRouteNo.number.toString(), title: busStopName, subtitle: snapshot.data.toString());
      },
    );
  }
}
