// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:trpgtool/players/createPlayerPage.dart';
import 'package:trpgtool/dicePage/dicePage.dart';
import 'package:trpgtool/players/investgatiorPage.dart';
import 'package:trpgtool/randomAbsPage/randomNumberPage.dart';
import 'package:trpgtool/settingPage.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'MainPage/mainPageAppBar.dart';
import 'drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TRPG Tool',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/setting': (context) => SettingPage(),
        '/dice': (context) => DicePage(),
        '/randomNumber': (context) => RandomNumberPage(),
        '/player' : (context) => InvestigatorPage(),
        '/createPlayer': (context) => CreatePlayerPage()
      },
    );
  }
}

class MainPage extends StatefulWidget {
  MainPageState createState() => MainPageState();
}

class MainPageState extends State {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: mainPageAppBar(context, "Home"),
        drawer: mainPageDrawer(context),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(2.0),
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: 2,
                mainAxisSpacing: 10,
                children: <Widget>[
                  diceCardButton(),
                  randomNumberCardButton(),
                  investigatorCardButton(),
                  settingCardButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget diceCardButton(){
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/dice');
      },
      child: Card(
        color: Colors.black38,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(MdiIcons.diceD20, size: 40, color: Colors.white),
            Text('Dice', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget randomNumberCardButton(){
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/randomNumber');
      },
      child: Card(
        color: Colors.black38,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(MdiIcons.diceMultiple, size: 40, color: Colors
                .white),
            Text('Random Number', style: TextStyle(
                color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget investigatorCardButton(){
    return  GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/player');
      },
      child: Card(
        color: Colors.black38,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(MdiIcons.accountDetails, size: 40, color: Colors
                .white),
            Text('Investigator', style: TextStyle(
                color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget settingCardButton(){
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/setting');
      },
      child: Card(
        color: Colors.black38,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(MdiIcons.settings, size: 40, color: Colors
                .white),
            Text('Setting', style: TextStyle(
                color: Colors.white)),
          ],
        ),
      ),
    );
  }
}