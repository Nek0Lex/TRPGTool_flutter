import 'package:trpgtool/MainPage/mainPageAppBar.dart';
import 'package:trpgtool/drawer.dart';
import 'package:trpgtool/repository/db_helper.dart';
import 'package:trpgtool/repository/player.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PlayerData {
  String name;
  String job;
  String sex;
  String age;
  String placeOfBirth;
}

class CreatePlayerPage extends StatefulWidget {
  CreatePlayerPageState createState() => CreatePlayerPageState();
}

class CreatePlayerPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainPageAppBar(context, "Create Player"),
      drawer: mainPageDrawer(context),
      body: CreatePlayerForm(),
    );
  }
}

class CreatePlayerForm extends StatefulWidget {
  CreatePlayerFormState createState() => CreatePlayerFormState();
}

class CreatePlayerFormState extends State<CreatePlayerForm> {
  final _formKey = GlobalKey<FormState>();
  DatabaseHelper playerDb = DatabaseHelper.instance;
  PlayerData _playerData = new PlayerData();
  List<String> _formLabelText = ['Name', 'Job', 'Sex', 'Age', 'Place of birth'];
  List<IconData> _formIcon = [
    MdiIcons.account,
    MdiIcons.worker,
    MdiIcons.genderTransgender,
    MdiIcons.formatListNumbered,
    MdiIcons.baby
  ];

  @override
  Widget build(BuildContext context) {
    return formBody(context);
  }

  Widget formBody(BuildContext context){
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(_formIcon[0]),
                    labelText: _formLabelText[0],
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(_formIcon[0]),
                    labelText: _formLabelText[1],
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(_formIcon[0]),
                    labelText: _formLabelText[2],
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(_formIcon[0]),
                    labelText: _formLabelText[3],
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(_formIcon[4]),
                    labelText: _formLabelText[4],
                  ),
                ),
              ],
            ),
          ),
         submitButton(),
        ],
      ),
    );
  }

  Widget submitButton(){
    return Padding(
      padding: EdgeInsets.all(10),
      child: Center(
        child: ButtonTheme(
          buttonColor: Colors.grey[400],
          height: 50,
          minWidth: 200,
          child: RaisedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                playerDb.openSqlite();
                Save(_playerData);
                Navigator.pushNamed(context, "/player");
              }
            },
            child: Text('Create'),
          ),
        ),
      ),
    );
  }

  String formInput(int index, String value) {
    switch (index) {
      case 0:
        {
          return _playerData.name = value;
        }
        break;
      case 1:
        {
          return _playerData.job = value;
        }
        break;
      case 2:
        {
          return _playerData.sex = value;
        }
        break;
      case 3:
        {
          return _playerData.age = value;
        }
        break;
      case 4:
        {
          return _playerData.placeOfBirth = value;
        }
        break;
    }
  }

  TextInputType numberFieldInput(int index) {
    if (index == 3) {
      return TextInputType.number;
    }
    return TextInputType.text;
  }

  List<TextInputFormatter> numberFieldInputFormatters(int index) {
    if (index == 3) {
      return [WhitelistingTextInputFormatter.digitsOnly];
    }
  }

  void Save(PlayerData playerData) async {
    await playerDb.openSqlite();
    await playerDb.insert(new Player.fromPlayer(playerData));
    await playerDb.close();
  }
}

//            Container(
//              height: 500,
//              child: ListView.builder(
//                itemCount: _formLabelText.length,
//                itemBuilder: (BuildContext context, int index) {
//                  return TextFormField(
//                    inputFormatters: numberFieldInputFormatters(index),
//                    keyboardType: numberFieldInput(index),
//                    decoration: InputDecoration(
//                      icon: Icon(_formIcon[index]),
//                      labelText: _formLabelText[index],
//                    ),
//                    validator: (value) {
////              return value.isEmpty ? 'Please enter some text' : _playerData.name = value;
//                      if (value.isEmpty) {
//                        return 'This can not be empty';
//                      } else {
//                        formInput(index, value);
//                      }
//                      return null;
//                    },
//                  );
//                },
//              ),
//            ),
