import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String leading, title, subtitle;

  const MyListTile({super.key, required this.leading, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      height: 100,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(right: 10),
              width: 100,
              child: Center(child: Text(leading, style: TextStyle(fontSize: 24),),)),
          Container(
              width: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 20),),
                  SizedBox(height: 10),
                  subtitle != "" ? Text(subtitle) : CircularProgressIndicator(),
                ],
              ),
          ),
        ],
      ),
    );
  }
}