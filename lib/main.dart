import 'package:flutter/material.dart';
import 'package:testproject/bus/widget/busbuilder.dart';
import 'package:testproject/bus/wrapper/busroute_no.dart';
import 'package:testproject/my_listtile.dart';
import 'package:testproject/subway/enums/daejeonsubway.dart';
import 'package:testproject/subway/enums/subwayudtype.dart';
import 'package:testproject/subway/widget/subwaybuilder.dart';

import 'bus/wrapper/busstop_id.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "뭐 타고 가지..",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("학교 가자..", style: TextStyle(color: Colors.white))
        ),
        body: SafeArea(
          child: ListView(
            children: const [
              BusBuilder(busStopId: BusStopId("BS461660"), busRouteNo: BusRouteNo(101), busStopName: "개나리아파트"),
              SubwayBuilder(daejeonSubway: DaejeonSubway.tanbang, subwayUDType: SubwayUDType.up),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.school)),
              IconButton(onPressed: (){}, icon: Icon(Icons.home)),
            ],
          ),
        ),
      )
    );
  }
}
