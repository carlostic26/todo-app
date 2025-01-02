import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/features/todo/data/datasources/local_database.dart';
import 'package:todo_app/features/todo/data/models/todo_model.dart';
import 'package:todo_app/features/todo/domain/entities/entity.dart';
import 'package:todo_app/features/todo/domain/repositories/repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final LocalDatabaseHelper _dbHelper = LocalDatabaseHelper();

  Future<Database> get _database async => await _dbHelper.getDatabase();

  @override
  Future<List<TodoModel>> fetchTodos() async {
    final db = await _database;
    final maps = await db.query('todos');
    return List.generate(maps.length, (i) {
      return TodoModel(
        id: maps[i]['id'] as String,
        title: maps[i]['title'] as String,
        description: maps[i]['description'] as String,
        isCompleted: (maps[i]['isCompleted'] as int) == 1,
      );
    });
  }

  @override
  Future<void> addTodo(Todo todo) async {
    final db = await _database;
    await db.insert(
      'todos',
      {
        'id': todo.id,
        'title': todo.title,
        'description': todo.description,
        'isCompleted': todo.isCompleted ? 1 : 0,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    final db = await _database;
    await db.update(
      'todos',
      {
        'title': todo.title,
        'description': todo.description,
        'isCompleted': todo.isCompleted ? 1 : 0,
      },
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  @override
  Future<void> deleteTodo(String id) async {
    final db = await _database;
    await db.delete(
      'todos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
