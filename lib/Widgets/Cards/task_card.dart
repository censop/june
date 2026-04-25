import 'package:flutter/material.dart';
import 'package:june/Models/task.dart';
import 'package:june/Utils/format_utils.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
    required this.task
  });

  final Task task;

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
                Text(
                  "${FormatUtils.timeOfDayToString(widget.task.startTime)} - ${FormatUtils.timeOfDayToString(widget.task.endTime)}",
                  textAlign: TextAlign.start,
                ),
                Text(
                  "${widget.task.taskName}",
                  textAlign: TextAlign.start,
                ),
                Text(
                  "${widget.task.description}",
                  textAlign: TextAlign.start,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}