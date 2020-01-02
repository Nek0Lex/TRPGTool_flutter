import 'package:trpgtool/players/createPlayerPage.dart';
import 'package:trpgtool/repository/db_helper.dart';
import 'package:sqflite/sqflite.dart';

final String tablePlayer = 'player';
final String columnId = '_id';
final String columnName = 'name';
final String columnSex = 'sex';
final String columnAge = 'age';
final String columnJob = 'job';
final String columnPlaceOfBirth = 'placeOfBirth';

class Player {
  int id; //handled by auto increment
  String name;
  String job;
  String sex;
  int age;
  String placeOfBirth;

//  Player(this.id, this.name, this.job, this.sex, this.age, this.placeOfBirth);
  Player(this.name, this.job, this.sex, this.age, this.placeOfBirth);

  Player.fromPlayer(PlayerData playerData){
    this.name = playerData.name;
    this.job = playerData.job;
    this.sex = playerData.sex;
    this.age = int.parse(playerData.age);
    this.placeOfBirth = playerData.placeOfBirth;
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnSex: sex,
      columnAge: age,
      columnJob: job,
      columnPlaceOfBirth: placeOfBirth,
    };
//    if (id != null) {
//      map[columnId] = id;
//    }
    return map;
  }

  Player.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    sex = map[columnSex];
    age = map[columnAge];
    job = map[columnJob];
    placeOfBirth = map[columnPlaceOfBirth];
  }
}