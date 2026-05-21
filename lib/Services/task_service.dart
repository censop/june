import 'package:june/Models/task.dart';
import 'package:june/main.dart';

class TaskService {
  static String _userId() {
    final id = supabase.auth.currentUser?.id;
    if (id == null) throw Exception('User not authenticated');
    return id;
  }

  static Future<List<Task>> fetchForDate(DateTime date) async {
    try {
      final dayStart = DateTime(date.year, date.month, date.day);
      final dayEnd = dayStart.add(const Duration(days: 1));

      final response = await supabase
          .from('Tasks')
          .select()
          .eq('user_id', _userId())
          .gte('starts_at', dayStart.toIso8601String())
          .lt('starts_at', dayEnd.toIso8601String())
          .order('starts_at');

      return response.map((json) => Task.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch tasks: $e');
    }
  }

  static Future<String> insert({
    required String title,
    required DateTime startsAt,
    required DateTime endsAt,
  }) async {
    try {
      final response = await supabase.from('Tasks').insert({
        'title': title,
        'starts_at': startsAt.toIso8601String(),
        'ends_at': endsAt.toIso8601String(),
        'status': 'pending',
        'user_id': _userId(),
      }).select('id').single();
      return response['id'] as String;
    } catch (e) {
      throw Exception('Failed to insert task: $e');
    }
  }

  static Future<void> updateStatus(String id, String status) async {
    try {
      await supabase.from('Tasks').update({'status': status}).eq('id', id);
    } catch (e) {
      throw Exception('Failed to update task status: $e');
    }
  }

  static Future<void> update({
    required String id,
    required String title,
    required DateTime startsAt,
    required DateTime endsAt,
  }) async {
    try {
      await supabase.from('Tasks').update({
        'title': title,
        'starts_at': startsAt.toIso8601String(),
        'ends_at': endsAt.toIso8601String(),
      }).eq('id', id);
    } catch (e) {
      throw Exception('Failed to update task: $e');
    }
  }

  static Future<void> delete(String id) async {
    try {
      await supabase.from('Tasks').delete().eq('id', id);
    } catch (e) {
      throw Exception('Failed to delete task: $e');
    }
  }
}
