import 'package:todo_app/features/todo/data/models/todo_model.dart';
import 'package:todo_app/features/todo/domain/repositories/repository.dart';

class FetchTodosUseCase {
  late final TodoRepository repository;

  FetchTodosUseCase(this.repository);

  Future<List<TodoModel>> call() async {
    return repository.fetchTodos();
  }
}
