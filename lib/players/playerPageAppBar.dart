
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

Widget playerPageAppBar(BuildContext context){

	void choiceAction(String choice) {
		if(choice == Constants.Settings){
			Navigator.pushNamed(context, '/setting');
		}
	}

	return AppBar(
		title: Text('Players'),
		actions: <Widget>[
			Row(
				mainAxisAlignment: MainAxisAlignment.spaceEvenly,
				children: <Widget>[
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