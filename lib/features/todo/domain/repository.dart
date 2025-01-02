import 'package:todo_app/features/todo/data/model/todo_model.dart';
import 'package:todo_app/features/todo/domain/entity.dart';

abstract class TodoRepository {
  Future<List<TodoModel>> fetchTodos();
  Future<void> addTodo(TodoModel todoModel);
  Future<void> updateTodo(TodoModel todoModel);
  Future<void> deleteTodo(String id);
}
