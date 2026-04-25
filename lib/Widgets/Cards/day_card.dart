import 'package:flutter/material.dart';

class DayCard extends StatefulWidget {
  const DayCard({super.key});

  @override
  State<DayCard> createState() => _DayCardState();
}

class _DayCardState extends State<DayCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
              ],
            )
          ],
        ),
      ),
    );
  }
}