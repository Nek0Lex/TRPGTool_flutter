import 'package:trpgtool/constants.dart';
import 'package:trpgtool/dicePage/dicePage.dart';
import 'package:trpgtool/settingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

Widget mainPageAppBar(BuildContext context, String title){

  void choiceAction(String choice) {
    if(choice == Constants.Settings){
      Navigator.pushNamed(context, '/setting');
    }
  }
  return AppBar(
    title: Text(title),
    backgroundColor: Colors.orangeAccent,
    actions: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          circleAvatarSwitch(title, context),
          SizedBox(
            width: 10,
          ),
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context){
              return Constants.choices.map((String choice){
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      )
    ],
  );
}

Widget circleAvatarSwitch(String title, BuildContext context){
  if(title == "Random Number"){
    return IconButton(
      icon: Icon(MdiIcons.refresh),
      onPressed: (){
        Navigator.pushReplacementNamed(context, "/randomNumber");
      },
    );
  } else if (title == "Dice"){
    return IconButton(
      icon: Icon(MdiIcons.refresh, color: Colors.white,),
      onPressed: (){

      },
    );
  }
  else {
    return CircleAvatar(
      backgroundImage: AssetImage('assets/images/avater.jpg'),
      radius: 20,
    );
  }
}

Widget settingPageAppBar(BuildContext context){
  void choiceAction(String choice) {
    if(choice == Constants.Settings){
      Navigator.pushNamed(context, '/setting');
    }
  }
  return AppBar(
    title: Text(Constants.Settings),
    backgroundColor: Colors.orangeAccent,
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    actions: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/avater.jpg'),
            radius: 20,
          ),
          SizedBox(
            width: 10,
          ),
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context){
              return Constants.choices.map((String choice){
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      )
    ],
  );
}
