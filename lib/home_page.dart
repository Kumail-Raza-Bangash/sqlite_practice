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
      body: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: GestureDetector(
          onTap: () async {
            await DbHandler().insertData(1, "Safeen", 17);
            final data = await DbHandler().fetchtData();
            if (kDebugMode) {
              print(data);
            }
          },
          child: const Center(
            child: Text("Add"),
          ),
        ),
      ),
    );
  }
}
