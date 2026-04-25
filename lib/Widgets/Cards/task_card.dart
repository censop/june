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
      color: Colors.white,
      elevation: 0.7,
      shadowColor: Theme.of(context).colorScheme.primary.withAlpha(100),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), 
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16,24,16,24),
        child: Row(
          mainAxisSize: MainAxisSize.max ,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.task.taskName,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "${FormatUtils.timeOfDayToString(widget.task.startTime)} - ${FormatUtils.timeOfDayToString(widget.task.endTime)}",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withAlpha(150)
                    ),
                  ),
                ],
              ),
            ),
            Checkbox(
              value: widget.task.isCompleted, 
              shape: CircleBorder(),
              onChanged: (isChanged) {
              },
              side: BorderSide(
                width: 0.7,
                color:Theme.of(context).colorScheme.onSurface.withAlpha(100) 
              ),
            ),
          ],
        ),
      ),
    );
  }
}