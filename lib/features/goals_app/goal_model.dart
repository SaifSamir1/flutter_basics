import 'package:hive_flutter/hive_flutter.dart';

part 'goal_model.g.dart';

@HiveType(typeId: 0)
class GoaLModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final DateTime createdAt;

  GoaLModel({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
  });
}
