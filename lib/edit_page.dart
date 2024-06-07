// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:sqlite_practice_01/crud_button.dart';
import 'package:sqlite_practice_01/data_page.dart';
import 'package:sqlite_practice_01/db_handler.dart';
import 'package:sqlite_practice_01/model_class.dart';

class EditPage extends StatefulWidget {
  final ModelClass item;

  const EditPage({super.key, required this.item});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Populate the text fields with the existing data
    nameController.text = widget.item.name;
    ageController.text = widget.item.age.toString();
  }

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
        title: const Text("Edit Your DATA"),
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
              buttonName: 'Update',
              onTap: () async {
                final updatedName = nameController.text;
                final updatedAge = int.tryParse(ageController.text);

                if (updatedName.isNotEmpty && updatedAge != null) {
                  // Create an updated ModelClass instance
                  final updatedItem = ModelClass(
                    id: widget.item.id,
                    name: updatedName,
                    age: updatedAge,
                  );

                  // Update the item in the database
                  await DbHandler().updateData(updatedItem);

                  // Show a snackbar or a dialog to confirm update
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Data updated successfully')),
                  );

                  // Navigate back to the previous screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DataPage(),
                    ),
                  );
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
