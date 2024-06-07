import 'package:flutter/material.dart';
import 'package:sqlite_practice_01/crud_button.dart';
import 'package:sqlite_practice_01/data_page.dart';
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

            // Text Field
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(hintText: "Name"),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: ageController,
                    decoration: const InputDecoration(hintText: "age"),
                  ),
                ],
              ),
            ),
            // Text Field
            const SizedBox(height: 10),
            // INSERT
            CRUDButton(
              buttonName: 'Insert Data',
              onTap: () async {
                await DbHandler()
                    .insertData(
                      ModelClass(
                        name: nameController.text,
                        age: int.parse(ageController.text),
                      ),
                    )
                    .then(
                      (value) => (value) {
                        print("Inserted DATA");
                      },
                    );
                ;
              },
            ),
            // INSERT
            const SizedBox(height: 10),
            // READ
            CRUDButton(
              buttonName: 'Read',
              onTap: () async {
                await DbHandler().fetchtData().then(
                      (value) => (value) {
                        print("Reading DATA");
                      },
                    );

                // Navigate
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DataPage(),
                  ),
                );
                // Navigate
              },
            ),
            // READ
            const SizedBox(height: 10),
            // UPDATE
            CRUDButton(
              buttonName: 'Update',
              onTap: () async {
                await DbHandler()
                    .updateData(
                      ModelClass(
                        id: 1,
                        name: 'Safeen',
                        age: 17,
                      ),
                    )
                    .then(
                      (value) => (value) {
                        print("data Updated");
                      },
                    );
              },
            ),
            // UPDATE
            const SizedBox(height: 10),
            // DELETE
            CRUDButton(
              buttonName: 'Delete',
              onTap: () async {
                await DbHandler().deleteData(2).then(
                      (value) => (value) {
                        print("DATA Deleted");
                      },
                    );
              },
            ),
            // DELETE
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
