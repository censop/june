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
      appBar: AppBar( //can make it a seperate widget
        title: Text("June Logo Placeholder"),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.tune) 
          ),
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.settings)
          )
        ],
      ),
      body: Center(
        child: Text("guguggaga"),
      ),
    );
  }
}