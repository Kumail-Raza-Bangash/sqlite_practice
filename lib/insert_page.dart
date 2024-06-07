import 'package:flutter/material.dart';
import 'package:sqlite_practice_01/crud_button.dart';
import 'package:sqlite_practice_01/db_handler.dart';
import 'package:sqlite_practice_01/model_class.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed.
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Insert Your DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "Name"),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: ageController,
              keyboardType:
                  TextInputType.number, // Ensures only numbers are entered
              decoration: const InputDecoration(hintText: "Age"),
            ),
            const SizedBox(height: 10),
            CRUDButton(
              buttonName: 'Insert',
              onTap: () async {
                final name = nameController.text;
                final age = int.tryParse(ageController.text);
                if (name.isNotEmpty && age != null) {
                  // Create a new ModelClass instance
                  final newItem = ModelClass(name: name, age: age);
                  // Insert the new item into the database
                  await DbHandler().insertData(newItem);
                  // Show a snackbar or a dialog to confirm insertion
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Data inserted successfully')),
                  );
                  // Optionally, clear the text fields after insertion
                  nameController.clear();
                  ageController.clear();
                } else {
                  // Show an error message if the input is invalid
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter valid data')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
