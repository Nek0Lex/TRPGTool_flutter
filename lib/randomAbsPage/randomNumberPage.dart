import 'dart:math';
import 'dart:async';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../MainPage/mainPageAppBar.dart';
import '../drawer.dart';

class RandomNumberPage extends StatefulWidget {
  RandomNumberPageState createState() => RandomNumberPageState();
}

class RandomNumberPageState extends State {
  var list, random;
  static const List title = [
    "STR",
    "CON",
    "DEX",
    "APP",
    "POW",
    "SIZ",
    "INT",
    "EDU"
  ];


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: mainPageAppBar(context, "Random Number"),
        drawer: mainPageDrawer(context),
        body: RefreshIndicator(
          child: ListView.builder(
            itemCount: 7,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Container(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(title[index]),
                      Text(randomNumGen()),
                    ],
                  ),
                ),
              );
            },
          ),
          onRefresh: () {
            return Navigator.pushReplacementNamed(context, "/randomNumber");
          },
        ),
      ),
    );
  }

  String randomNumGen() {
    var rng = new Random();
    return rng.nextInt(99).toString();
  }
}
