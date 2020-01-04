import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:trpgtool/dicePage/dicePage.dart';
import '../constants.dart';

Widget dicePageAppBar(BuildContext context, String title){
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
					IconButton(
							icon: Icon(MdiIcons.refresh, color: Colors.white),
							onPressed: (){
								new DicePageState().calculateDicePoint();
							}
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