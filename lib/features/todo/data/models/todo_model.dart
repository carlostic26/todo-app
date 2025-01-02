import 'package:todo_app/features/todo/domain/entities/entity.dart';

class TodoModel extends Todo {
  TodoModel(
      {required super.description,
      required super.id,
      required super.title,
      required super.isCompleted});

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      id: map['id'] ?? '',
      isCompleted: map['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'id': id,
    };
  }

  TodoModel copyWith({
    String? title,
    String? description,
    String? id,
    required bool isCompleted,
  }) {
    return TodoModel(
      title: title ?? this.title,
      description: description ?? this.description,
      id: id ?? this.id,
      isCompleted: isCompleted,
    );
  }
}
