// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:sqlite_practice_01/db_handler.dart';
import 'package:sqlite_practice_01/edit_page.dart';
import 'package:sqlite_practice_01/model_class.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Data Page"),
      ),
      body: FutureBuilder(
        future: DbHandler().fetchtData(),
        builder: (context, AsyncSnapshot<List<ModelClass>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                  title: Text(
                    "Name: ${item.name}",
                    style: const TextStyle(fontSize: 25),
                  ),
                  subtitle: Text(
                    "Age: ${item.age.toString()}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  trailing: SizedBox(
                    width: 80, // Adjust the width as needed
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigate to EditPage with the item data
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditPage(item: item),
                              ),
                            );
                          },
                          child: const Icon(Icons.edit),
                        ),
                        const SizedBox(width: 16),
                        InkWell(
                          onTap: () async {
                            await DbHandler()
                                .deleteData(item.id!)
                                .then((value) {
                              print("DATA Deleted");
                              // Refresh the state to show updated list
                              setState(() {});
                            });
                          },
                          child: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("No data found"));
          }
        },
      ),
    );
  }
}
