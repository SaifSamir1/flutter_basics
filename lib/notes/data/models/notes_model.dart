


class NotesModel {
  final String?  id;
  final String title;
  final String description;
  final String createdAt;
   

  NotesModel({
    this.id,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  factory NotesModel.fromJson(Map<String, dynamic> json , String id) {
    return NotesModel(
      id: id,
      title: json['title'] as String,
      description: json['description'] as String,
      createdAt: json['createdAt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'createdAt': createdAt,
    };
  }
}