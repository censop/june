import 'package:june/Models/subtask.dart';
import 'package:june/main.dart';

class SubtaskService {
  static Future<List<Subtask>> fetchForTask(String taskId) async {
    try {
      final response = await supabase
          .from('Subtasks')
          .select()
          .eq('task_id', taskId)
          .order('created_at');

      return response.map((json) => Subtask.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch subtasks: $e');
    }
  }

  static Future<void> insert({
    required String taskId,
    required String title,
    bool done = false,
  }) async {
    try {
      await supabase.from('Subtasks').insert({
        'task_id': taskId,
        'title': title,
        'done': done,
      });
    } catch (e) {
      throw Exception('Failed to insert subtask: $e');
    }
  }

  static Future<void> deleteAllForTask(String taskId) async {
    try {
      await supabase.from('Subtasks').delete().eq('task_id', taskId);
    } catch (e) {
      throw Exception('Failed to delete subtasks for task: $e');
    }
  }

  static Future<void> updateDone(String id, bool done) async {
    try {
      await supabase.from('Subtasks').update({'done': done}).eq('id', id);
    } catch (e) {
      throw Exception('Failed to update subtask done state: $e');
    }
  }

  static Future<void> updateTitle(String id, String title) async {
    try {
      await supabase.from('Subtasks').update({'title': title}).eq('id', id);
    } catch (e) {
      throw Exception('Failed to update subtask title: $e');
    }
  }

  static Future<void> delete(String id) async {
    try {
      await supabase.from('Subtasks').delete().eq('id', id);
    } catch (e) {
      throw Exception('Failed to delete subtask: $e');
    }
  }
}
