import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/features/todo/data/model/todo_model.dart';
import 'package:todo_app/features/todo/data/repository_impl.dart';
import 'package:todo_app/features/todo/domain/entity.dart';
import 'package:todo_app/features/todo/domain/repository.dart';

// Providers for todo_repository_impl.dart
class TodoListNotifier extends StateNotifier<List<TodoModel>> {
  final TodoRepository todoRepository;

  TodoListNotifier(this.todoRepository) : super([]) {
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    final todos = await todoRepository.fetchTodos();
    state = todos;
  }

  Future<void> addTodo(TodoModel todo) async {
    await todoRepository.addTodo(todo);
    state = [...state, todo];
  }

  Future<void> updateTodo(TodoModel updatedTodo) async {
    await todoRepository.updateTodo(updatedTodo);
    state = [
      for (final todo in state)
        if (todo.id == updatedTodo.id) updatedTodo else todo
    ]; // Actualiza el todo en el estado
  }

  Future<void> deleteTodo(String id) async {
    await todoRepository.deleteTodo(id);
    state = state
        .where((todo) => todo.id != id)
        .toList(); // Elimina el todo del estado
  }
}

// Aquí defines el todoListProvider
final todoListProvider =
    StateNotifierProvider<TodoListNotifier, List<TodoModel>>(
  (ref) {
    final todoRepository = ref.read(todoRepositoryProvider);
    return TodoListNotifier(todoRepository);
  },
);

// Define el provider para el repositorio
final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  return TodoRepositoryImpl();
});
