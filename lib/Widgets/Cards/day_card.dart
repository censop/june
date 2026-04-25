import 'package:flutter/material.dart';
import 'package:june/Models/day.dart';

class DayCard extends StatefulWidget {
  const DayCard({
    super.key,
    required this.day,
  });

  final Day day;

  @override
  State<DayCard> createState() => _DayCardState();
}


class _DayCardState extends State<DayCard> {
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
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.day.shortName,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withAlpha(100)
                  ),
                ),
                Text(
                  widget.day.dayNumber,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            SizedBox(width: 32),
            Text( ///either turn this to icon button or button or make the entire card clickable
              widget.day.longName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Spacer(),
            Text(
              "${widget.day.tasks.length} TASKS",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(100)
              ),
            ),
            SizedBox(width: 12),
            Icon(
              Icons.arrow_forward_ios,
              size: 12,
              color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
            )
          ],
        ),
      ),
    );
  }
}