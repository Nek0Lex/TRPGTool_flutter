import 'package:d20/d20.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../constants.dart';
import '../drawer.dart';
import 'dicePageAppBar.dart';

class DicePage extends StatefulWidget {
  DicePageState createState() => DicePageState();
}


class DicePageState extends State {
  var dropDownValueL, dropDownValueR;
  String d20String = "0";


  void calculateDicePoint() {
    setState(() {
      var dropDownValue1 = this.dropDownValueL;
      var dropDownValue2 = this.dropDownValueR;
      final d20 = D20();
      if (dropDownValue1 == null || dropDownValue2 == null) {
        d20String =  "0";
      } else {
        d20String = dropDownValue1.toString() + 'd' + dropDownValue2.toString();
        d20String =  d20.roll(d20String).toString();
      }
    });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: dicePageAppBar(context, "Dice"),
        drawer: mainPageDrawer(context),
        body: diceSelection(),
    );
  }


  Widget diceSelection() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.black45
              ),
              child: Center(
                  child: Text(
                    d20String,
                    style: TextStyle(fontSize: 70, color: Colors.white),
                  )
              ),
            ),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 50,
              child: DropdownButton<String>(
                items: <String>['1', '2', '3', '4'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                value: dropDownValueL,
                isExpanded: true,
                onChanged: (String newValue) {
                  setState(() {
                    dropDownValueL = newValue;
                    calculateDicePoint();
                  });
                },
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                style: Theme
                    .of(context)
                    .textTheme
                    .title,
              ),
            ),
            Text(
              "D",
              style: TextStyle(fontSize: 35),
            ),
            Container(
              width: 60,
              child: DropdownButton<String>(
                isExpanded: true,
                value: dropDownValueR,
                items: <String>['3', '4', '6', '8', '10', '12', '20', '100'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (String newValue) {
                  setState(() {
                    dropDownValueR = newValue;
                    calculateDicePoint();
                  });
                },
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                style: Theme
                    .of(context)
                    .textTheme
                    .title,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                calculateDicePoint();
              },
              child:Text('Refresh', style: TextStyle(color: Colors.white),),
              color: Colors.black38,
            )
          ],
        )
      ],
    );
  }

//  Widget dicePageAppBar(BuildContext context, String title){
//    void choiceAction(String choice) {
//      if(choice == Constants.Settings){
//        Navigator.pushNamed(context, '/setting');
//      }
//    }
//
//    return AppBar(
//      title: Text(title),
//      backgroundColor: Colors.orangeAccent,
//      actions: <Widget>[
//        Row(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: <Widget>[
//            IconButton(
//              icon: Icon(MdiIcons.refresh, color: Colors.white),
//              onPressed: (){
//                calculateDicePoint();
//              }
//            ),
//            SizedBox(
//              width: 10,
//            ),
//            PopupMenuButton<String>(
//              onSelected: choiceAction,
//              itemBuilder: (BuildContext context){
//                return Constants.choices.map((String choice){
//                  return PopupMenuItem<String>(
//                    value: choice,
//                    child: Text(choice),
//                  );
//                }).toList();
//              },
//            )
//          ],
//        )
//      ],
//    );
//  }
}
