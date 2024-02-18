import 'package:flutter/material.dart';
import 'package:testproject/bus/widget/busbuilder.dart';
import 'package:testproject/bus/wrapper/busroute_no.dart';
import 'package:testproject/subway/enums/daejeonsubway.dart';
import 'package:testproject/subway/enums/subwayudtype.dart';
import 'package:testproject/subway/widget/subwaybuilder.dart';

import 'bus/wrapper/busstop_id.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<Widget> _itemList;
  int _selectedIndex = 0;
  String _title = "학교 가자..";

  void _handleRefresh() {
    if (_selectedIndex == 0) {
      _itemList = const [
        BusBuilder(busStopId: BusStopId("BS461660"), busRouteNo: BusRouteNo(101), busStopName: "개나리아파트"),
        SubwayBuilder(daejeonSubway: DaejeonSubway.tanbang, subwayUDType: SubwayUDType.up),
      ];
      _title = "학교 가자..";

    } else if (_selectedIndex == 1) {
      _itemList = const [
        BusBuilder(busStopId: BusStopId("BS460564"), busRouteNo: BusRouteNo(101), busStopName: "충남대학교"),
        BusBuilder(busStopId: BusStopId("BS460564"), busRouteNo: BusRouteNo(105), busStopName: "충남대학교"),
        SubwayBuilder(daejeonSubway: DaejeonSubway.yuseongSpa, subwayUDType: SubwayUDType.down),
      ];
      _title = "집 가자!!";
    }
  }

  void _handleTap(int index) {
    setState(() {
      _selectedIndex = index;
      _handleRefresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    _handleRefresh();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "뭐 타고 가지..",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(_title, style: TextStyle(color: Colors.white))
        ),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async { _handleRefresh(); },
            child: ListView(
              children: _itemList,
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.school), label: '학교'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '집'),
          ],
          selectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: _handleTap,
        ),
      )
    );
  }
}
