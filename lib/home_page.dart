import 'package:flutter/material.dart';
import 'package:sqlite_practice_01/crud_button.dart';
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
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text("SQLite Database"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            CRUDButton(
              buttonName: 'Create',
              onTap: () async {
                await DbHandler().insertData(9, "Ali", 7);
              },
            ),
            const SizedBox(height: 10),
            CRUDButton(
              buttonName: 'Read',
              onTap: () async {
                final data = await DbHandler().fetchtData();
                print(data);
              },
            ),
            const SizedBox(height: 10),
            CRUDButton(
              buttonName: 'Update',
              onTap: () async {
                await DbHandler().updateData(
                  1,
                  {
                    'id': 1,
                    "name": "Alyan",
                    "age": 11,
                  },
                );
                print("data Updated");
              },
            ),
            const SizedBox(height: 10),
            CRUDButton(
              buttonName: 'Delete',
              onTap: () async {
                await DbHandler().deleteData(2);
                print("data Deleted");
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
