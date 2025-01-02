import 'package:todo_app/features/todo/data/models/todo_model.dart';

abstract class TodoRepository {
  Future<List<TodoModel>> fetchTodos();
  Future<void> addTodo(TodoModel todoModel);
  Future<void> updateTodo(TodoModel todoModel);
  Future<void> deleteTodo(String id);
}
