import 'package:todo_app/features/todo/data/models/todo_model.dart';
import 'package:todo_app/features/todo/domain/repositories/repository.dart';

class AddTodoUseCase {
  late final TodoRepository repository;

  AddTodoUseCase(this.repository);

  Future<void> call(TodoModel todo) async {
    return repository.addTodo(todo);
  }
}
