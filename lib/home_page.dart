import 'package:flutter/material.dart';
import 'package:sqlite_practice_01/crud_button.dart';
import 'package:sqlite_practice_01/db_handler.dart';
import 'package:sqlite_practice_01/model_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(hintText: "Name"),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: ageController,
                decoration: const InputDecoration(hintText: "age"),
              ),
            ),
            const SizedBox(height: 10),
            CRUDButton(
              buttonName: 'Insert Data',
              onTap: () async {
                await DbHandler().insertData(
                  ModelClass(
                    name: nameController.text,
                    age: int.parse(ageController.text),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            CRUDButton(
              buttonName: 'Read',
              onTap: () async {
                final data = await DbHandler().fetchtData();
                print(data[0].name);
              },
            ),
            const SizedBox(height: 10),
            CRUDButton(
              buttonName: 'Update',
              onTap: () async {
                await DbHandler().updateData(
                  ModelClass(
                    id: 1,
                    name: 'Safeen',
                    age: 17,
                  ),
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
