import 'dart:io';
import 'package:trpgtool/repository/player.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String tablePlayer = 'player';
final String columnId = '_id';
final String columnName = 'name';
final String columnSex = 'sex';
final String columnAge = 'age';
final String columnJob = 'job';
final String columnPlaceOfBirth = 'placeOfBirth';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Database db;
  openSqlite() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'player.db');

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE $tablePlayer (
            $columnId INTEGER PRIMARY KEY autoincrement, 
            $columnName TEXT, 
            $columnSex TEXT, 
            $columnAge INTEGER, 
            $columnJob TEXT,
            $columnPlaceOfBirth TEXT
            )
          ''');
      },
    );
  }

  Future<Player> insert(Player player) async {
    player.id = await db.insert(tablePlayer, player.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    return player;
  }

  Future<List<Player>> queryAll() async {
    List<Map> maps = await db.query(tablePlayer, columns: [
      columnId,
      columnName,
      columnSex,
      columnAge,
      columnJob,
      columnPlaceOfBirth,
    ]);

    if (maps == null || maps.length == 0) {
      return null;
    }

    List<Player> players = [];
    for (int i = 0; i < maps.length; i++) {
      players.add(Player.fromMap(maps[i]));
    }
    return players;
  }

  Future<Player> getPlayerById(int id) async {
    List<Map> maps = await db.query(tablePlayer,
        columns: [
          columnId,
          columnName,
          columnSex,
          columnAge,
          columnJob,
          columnPlaceOfBirth,
        ],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Player.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db
        .delete(tablePlayer, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(Player player) async {
    return await db.update(tablePlayer, player.toMap(),
        where: '$columnId = ?', whereArgs: [player.id]);
  }

  //must
  close() async {
    await db.close();
  }
}
