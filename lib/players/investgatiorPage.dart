import 'package:trpgtool/MainPage/mainPageAppBar.dart';
import 'package:trpgtool/drawer.dart';
import 'package:trpgtool/repository/db_helper.dart';
import 'package:trpgtool/repository/player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../constants.dart';
import 'playerPageAppBar.dart';

class InvestigatorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InvestigatorPageState();
  }
}

class InvestigatorPageState extends State {
  DatabaseHelper playerDb = DatabaseHelper.instance;
  var playerName = "";
  List<Player> allPlayers;

  @override
  void initState() {
    super.initState();
    getAllPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: playerPageAppBar(context),
      drawer: mainPageDrawer(context),
      body: investigatorPageListViewBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/createPlayer');
        },
        child: Icon(MdiIcons.plus),
        tooltip: "Add Player",
      ),
    );
  }

  Widget investigatorPageListViewBody(BuildContext context) {
    if (null != allPlayers) {
      return ListView.builder(
        itemCount: allPlayers.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            direction: DismissDirection.endToStart,
            background: Container(
              padding: EdgeInsets.only(right: 20.0),
              color: Colors.red,
              child: new Align(
                alignment: Alignment.centerRight,
                child: new Text('Delete',
                    textAlign: TextAlign.right,
                    style: new TextStyle(color: Colors.white)
                ),
              ),
            ),
            child: investigatorPageListViewBodyDisplay(allPlayers, index),
            key: UniqueKey(),
            onDismissed: (direction) {
              setState(() {
                deletePlayer(allPlayers[index].id);
              });
            },
          );
        },
      );
    } else {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '404',
                style: TextStyle(fontSize: 50, color: Colors.grey),
              ),
              Text(
                'Nothing Here',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              )
            ],
          ),
        ),
      );
    }
  }

  Widget investigatorPageListViewBodyDisplay(List<Player> allPlayers,
      int index) {
    return Card(
      child: Container(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(allPlayers[index].id.toString()),
            Text(allPlayers[index].name),
            Text(allPlayers[index].job),
            Text(allPlayers[index].sex),
            Text(allPlayers[index].age.toString()),
            Text(allPlayers[index].placeOfBirth),
          ],
        ),
      ),
    );
  }

  void getBookName() async {
    await playerDb.openSqlite();
    Player player = await playerDb.getPlayerById(1);
    setState(() {
      playerName = player.name;
    });
  }

  void getAllPlayers() async {
    await playerDb.openSqlite();
    List<Player> players = await playerDb.queryAll();
    setState(() {
      allPlayers = players;
    });
  }

  void deletePlayer(int id) async {
    await playerDb.openSqlite();
    await playerDb.delete(id);
    List<Player> players = await playerDb.queryAll();
    setState(() {
      allPlayers = players;
    });
  }
}
