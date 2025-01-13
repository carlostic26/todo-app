import 'package:todo_app/features/todo/data/models/todo_model.dart';

//Se conocen como "interfaces de repositorio" o "contratos"
//pregunta: Por qué?

abstract class TodoRepository {
  Future<List<TodoModel>> fetchTodos();
  Future<void> addTodo(TodoModel todoModel);
  Future<void> updateTodo(TodoModel todoModel);
  Future<void> deleteTodo(String id);
}
