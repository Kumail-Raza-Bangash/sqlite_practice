import 'package:flutter/material.dart';

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
          onTap: () {},
          child: const Center(
            child: Text("Add"),
          ),
        ),
      ),
    );
  }
}
