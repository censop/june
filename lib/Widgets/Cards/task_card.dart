import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
    required this.taskName,
    required this.startTime,
    required this.endTime,
    this.description //not necessary
  });

  final String taskName;
  final String startTime;
  final String endTime;
  final String? description;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.onSurface,
          width: 0.5,         
        ),
        borderRadius: BorderRadius.circular(16.0), 
      ),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max ,
          children: [
            Checkbox(
              value: false, 
              shape: CircleBorder(),
              onChanged: (_) {}
            ),
            Column(
              mainAxisSize: MainAxisSize.min ,
              children: [
                Text("${widget.startTime} - ${widget.endTime}"),
                Text("${widget.taskName}"),
                Text("${widget.description}"),
              ],
            )
          ],
        ),
      ),
    );
  }
}