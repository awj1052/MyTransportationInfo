import 'package:flutter/material.dart';
import 'package:testproject/my_listtile.dart';
import 'package:testproject/subway/subway.dart';

import '../enums/daejeonsubway.dart';
import '../enums/subwayudtype.dart';

class SubwayBuilder extends StatefulWidget {
  final DaejeonSubway daejeonSubway;
  final SubwayUDType subwayUDType;

  const SubwayBuilder({super.key, required this.daejeonSubway, required this.subwayUDType});

  @override
  State<SubwayBuilder> createState() => _SubwayBuilderState();
}

class _SubwayBuilderState extends State<SubwayBuilder> {
  @override
  Widget build(BuildContext context) {
    final DaejeonSubway daejeonSubway = widget.daejeonSubway;
    final SubwayUDType subwayUDType = widget.subwayUDType;

    return FutureBuilder(
        future: Subway.getTime(daejeonSubway, subwayUDType),
        builder: (context, snapshot) {
          if (snapshot.hasData == false) {
            return MyListTile(leading: "지하철", title: daejeonSubway.name, subtitle: "");
          } else if (snapshot.hasError) {
            return Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Error: ${snapshot.error}',
                  style: TextStyle(fontSize: 15),
                ),
            );
          }
          return MyListTile(leading: "지하철", title: daejeonSubway.name, subtitle: snapshot.data.toString());
        },
    );
  }
}
