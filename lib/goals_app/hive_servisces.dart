// ignore_for_file: avoid_print

import 'package:flutter_basics_app/goals_app/goal_model.dart';
import 'package:hive/hive.dart';

class HiveServices {
  static const String boxName = 'goalsBox';

  Future<void> createGoal(GoaLModel goal) async {
    try {
      final box = Hive.box<GoaLModel>(boxName);
      await box.put(goal.id, goal);
      print('Goal created with id: ${goal.id}');
    } catch (e) {
      print('Error creating goal: $e');
    }
  }

  List<GoaLModel> getAllGoals() {
    try {
      final box = Hive.box<GoaLModel>(boxName);
      return box.values.toList();
    } catch (e) {
      print('Error retrieving goals: $e');
      return [];
    }
  }

  Future<void> deleteGoal(String id) async {
    try {
      final box = Hive.box<GoaLModel>(boxName);
      await box.delete(id);
      print('Goal deleted with id: $id');
    } catch (e) {
      print('Error deleting goal: $e');
    }
  }
  Future<void> updateGoal(GoaLModel goal) async {
    try {
      final box = Hive.box<GoaLModel>(boxName);
      await box.put(goal.id, goal);
      print('Goal updated with id: ${goal.id}');
    } catch (e) {
      print('Error updating goal: $e');
    }
  }
}
