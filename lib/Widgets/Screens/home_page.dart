import 'package:flutter/material.dart';
import 'package:june/Widgets/Cards/day_card.dart';
import 'package:june/Widgets/Cards/task_card.dart';

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
        elevation: 3,
        shadowColor: Colors.black.withAlpha(30), 
        surfaceTintColor: Colors.transparent, 
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Theme.of(context).colorScheme.tertiary.withAlpha(120), 
            height: 1.0, 
          ),
        ),
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
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize:  MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text("Good Morning, CANSU\nReady to conquer the day?"),
            SizedBox(height: 16,),
            TaskCard( //placeholder until backend implemented
              taskName: "Study Block", 
              startTime: "11.30", 
              endTime: "15.30", 
              description: "This is a test",
            ),
            DayCard(),
          ] 
        ),
      ),
    );
  }
}