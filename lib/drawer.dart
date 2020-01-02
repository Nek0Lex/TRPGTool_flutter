import 'package:trpgtool/randomAbsPage/randomNumberPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dicePage/dicePage.dart';
import 'main.dart';

Widget mainPageDrawer(BuildContext context){
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('Drawer Header'),
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        ListTile(
          leading: Icon(Icons.format_list_numbered),
          title: Text('Genrate Number'),
          onTap: () {
            Navigator.pushNamed(context, '/randomNumber');
          },
        ),
        ListTile(
          leading: Icon(Icons.invert_colors),
          title: Text('Inestigator'),
          onTap: () {
            Navigator.pushNamed(context, '/player');
          },
        ),
        ListTile(
          leading: Icon(Icons.view_module),
          title: Text('Dice'),
          onTap: () {
            Navigator.pushNamed(context, '/dice');
          },
        ),
      ],
    ),
  );
}