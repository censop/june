import 'package:flutter/material.dart';

class Task {
  final String taskName;
  final String description;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final bool isCompleted;

  Task({
    required this.taskName,
    required this.description,
    required this.startTime,
    required this.endTime,
    this.isCompleted = false,
  });

  Task copyWith({
    String? taskName,
    String? description,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    bool? isCompleted,
  }) {
    return Task(
      taskName: taskName ?? this.taskName,
      description: description ?? this.description,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'taskName': taskName,
      'description': description,
      'startTime': '${startTime.hour}:${startTime.minute}',
      'endTime': '${endTime.hour}:${endTime.minute}',
      'isCompleted': isCompleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    // Helper function to parse the "HH:mm" string back into a TimeOfDay object
    TimeOfDay parseTime(String timeString) {
      final parts = timeString.split(':');
      return TimeOfDay(
        hour: int.parse(parts[0]),
        minute: int.parse(parts[1]),
      );
    }

    return Task(
      taskName: map['taskName'] ?? '',
      description: map['description'] ?? '',
      startTime: parseTime(map['startTime'] ?? '00:00'),
      endTime: parseTime(map['endTime'] ?? '00:00'),
      isCompleted: map['isCompleted'] ?? false,
    );
  }
}