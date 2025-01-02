import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/features/todo/data/model/todo_model.dart';
import 'package:todo_app/features/todo/domain/entity.dart';
import 'package:todo_app/features/todo/domain/repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  late Database _database;

  Future<void> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    _database = await openDatabase(
      join(dbPath, 'todo.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE todos(id TEXT PRIMARY KEY, title TEXT, description TEXT, isCompleted INTEGER)',
        );
      },
      version: 1,
    );
  }

  @override
  Future<List<TodoModel>> fetchTodos() async {
    await _initDatabase();
    final maps = await _database.query('todos');
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
    await _initDatabase();
    await _database.insert(
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
    await _initDatabase();
    await _database.update(
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
    await _initDatabase();
    await _database.delete(
      'todos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
