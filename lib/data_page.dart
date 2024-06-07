import 'package:flutter/material.dart';
import 'package:sqlite_practice_01/db_handler.dart';
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
        title: Text("Data Page"),
      ),
      body: FutureBuilder(
        future: DbHandler().fetchtData(),
        builder: (context, AsyncSnapshot<List<ModelClass>> snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
          }
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(snapshot.data![index].name),
                trailing: Text(snapshot.data![index].age.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
