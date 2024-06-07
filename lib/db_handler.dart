import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_practice_01/model_class.dart';

class DbHandler {
  Database? _database;

  // Create DATABASE
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    // fond path and create file
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'mydatabase.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE DatabaseTable (
            id INTEGER PRIMARY KEY, 
            name TEXT, 
            age INTEGER
          )
        ''');
      },
    );
    return _database;
  }

  // Create DATA in DATABASE
  Future<int> insertData(ModelClass modelClass) async {
    Database? db = await database;
    return db!.insert('DatabaseTable', modelClass.toMap());
  }

  // Fetch or Read DATABASE
  Future<List<ModelClass>> fetchtData() async {
    Database? db = await database;
    final list = await db!.query('DatabaseTable');
    return list.map((map) => ModelClass.fromMap(map)).toList();
  }

  // Delete DATABASE
  Future<int> deleteData(int id) async {
    Database? db = await database;
    return await db!.delete(
      'DatabaseTable',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Delete DATABASE
  Future<int> updateData(ModelClass modelClass) async {
    Database? db = await database;
    return await db!.update(
      'DatabaseTable',
      modelClass.toMap(),
      where: 'id = ?',
      whereArgs: [modelClass.id],
    );
  }
}
