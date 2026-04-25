import 'package:june/Models/task.dart';

enum DayOfWeek {
  monday('Mon'),
  tuesday('Tue'),
  wednesday('Wed'),
  thursday('Thu'),
  friday('Fri'),
  saturday('Sat'),
  sunday('Sun');

  final String shortName;
  const DayOfWeek(this.shortName);
}

class DayModel {
  final DayOfWeek dayName;
  final List<Task> tasks;

  DayModel({
    required this.dayName,
    this.tasks = const [], 
  });

  DayModel copyWith({
    DayOfWeek? dayName,
    List<Task>? tasks,
  }) {
    return DayModel(
      dayName: dayName ?? this.dayName,
      tasks: tasks ?? this.tasks,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'dayName': dayName.name, 
      'tasks': tasks.map((task) => task.toMap()).toList(),
    };
  }

  factory DayModel.fromMap(Map<String, dynamic> map) {
    return DayModel(
      dayName: DayOfWeek.values.firstWhere(
        (e) => e.name == map['dayName'],
        orElse: () => DayOfWeek.monday, 
      ),
      tasks: List<Task>.from(
        (map['tasks'] ?? []).map((taskMap) => Task.fromMap(taskMap)),
      ),
    );
  }
}