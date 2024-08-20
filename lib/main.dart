import 'dart:developer';

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
  static const int reloadableSeconds = 10;
  
  List<Widget> _itemList = [];
  int _selectedIndex = 0;
  String _title = "학교 가자..";
  DateTime _lastReload = DateTime.fromMicrosecondsSinceEpoch(0);

  void _handleTap(int index) {
    _handleRefresh(index);
  }

  void _handleRefresh(int index) {
    if (!_isReloadable(index)) return;
    _lastReload = DateTime.now();
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        _itemList = [
          BusBuilder(busStopId: BusStopId("BS461660"), busRouteNo: BusRouteNo(101), busStopName: "개나리아파트"),
          SubwayBuilder(daejeonSubway: DaejeonSubway.tanbang, subwayUDType: SubwayUDType.down),
          BusBuilder(busStopId: BusStopId("BS461292"), busRouteNo: BusRouteNo(108), busStopName: "월평역"),
        ];
        _title = "학교 가자..";

      } else if (_selectedIndex == 1) {
        _itemList = [
          BusBuilder(busStopId: BusStopId("BS460564"), busRouteNo: BusRouteNo(101), busStopName: "충남대학교"),
          BusBuilder(busStopId: BusStopId("BS460564"), busRouteNo: BusRouteNo(105), busStopName: "충남대학교"),
          SubwayBuilder(daejeonSubway: DaejeonSubway.yuseongSpa, subwayUDType: SubwayUDType.up),
        ];
        _title = "집 가자!!";
      }
    });
  }

  bool _isReloadable(int index) {
    if (_selectedIndex != index) return true;
    return DateTime.now().difference(_lastReload).inSeconds > reloadableSeconds;
  }

  @override
  Widget build(BuildContext context) {
    if (_itemList.isEmpty) _handleRefresh(_selectedIndex);
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
            onRefresh: () async {
                _handleRefresh(_selectedIndex);
              },
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
          selectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: _handleTap,
        ),
      )
    );
  }
}
