import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

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

  // Create DATABASE
  insertData(int id, String name, int age) async {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'age': age,
    };
    Database? db = await database;
    db!.insert('DatabaseTable', map);
  }

  // Fetch or Read DATABASE
  fetchtData() async {
    Database? db = await database;
    final list = db!.query('DatabaseTable');
    return list;
  }
}
