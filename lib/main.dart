import 'dart:io';

import 'package:flutter/material.dart';
import 'package:testproject/my_listtile.dart';
import 'package:testproject/subway/enums/daejeonsubway.dart';
import 'package:testproject/subway/enums/subwayudtype.dart';
import 'package:testproject/subway/subway.dart';
import 'package:testproject/subway/widget/subwaybuilder.dart';

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
              MyListTile(leading: "101번", title: "개나리아파트", subtitle: "정보 없음"),
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
