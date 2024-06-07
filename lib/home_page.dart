import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqlite_practice_01/db_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQLite Database"),
      ),
      body: Center(
        child: Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(20),
          ),
          child: GestureDetector(
            onTap: () async {
              await DbHandler().insertData(3, "Yazdan", 19);
              final data = await DbHandler().fetchtData();
              if (kDebugMode) {
                print(data);
              }
            },
            child: const Center(
              child: Text(
                "Add",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
