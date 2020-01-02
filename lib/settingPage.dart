import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MainPage/mainPageAppBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  SettingPageState createState() => SettingPageState();
}

class SettingPageState extends State {
  bool _isCheck;
  final prefs = SharedPreferences.getInstance();

  void initState() {
    super.initState();
    _isCheck = false;
  }

  @override
  Widget build(BuildContext context) {
    bool agreeSmsAlerts = false;

    return Scaffold(
      appBar: settingPageAppBar(context),
      body:Container(
        padding: EdgeInsets.all(10),
        child: Container(
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Dark Theme'),
              Transform.scale(
                scale: 1.2,
                child: Switch(
                  onChanged: (value) {
                    setState(() {
                      agreeSmsAlerts = value;
                    });
                  },
                  value: agreeSmsAlerts,
                ),
              ),
            ],
          ),
        )
      )
    );
  }

}
