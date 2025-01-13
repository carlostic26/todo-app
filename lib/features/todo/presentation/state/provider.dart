import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/features/todo/data/models/todo_model.dart';
import 'package:todo_app/features/todo/data/repositories/repository_impl.dart';
import 'package:todo_app/features/todo/domain/repositories/repository.dart';
import 'package:todo_app/features/todo/domain/usecases/add_todo.dart';
import 'package:todo_app/features/todo/domain/usecases/delete_todo.dart';
import 'package:todo_app/features/todo/domain/usecases/fetch_todo.dart';
import 'package:todo_app/features/todo/domain/usecases/update_todo.dart';
import 'package:todo_app/features/todo/presentation/state/use_cases_providers.dart';

//Gestiona el estado de la lista de tareas.

class TodoListNotifier extends StateNotifier<List<TodoModel>> {
  final FetchTodosUseCase fetchTodosUseCase;
  final AddTodoUseCase addTodoUseCase;
  final UpdateTodoUseCase updateTodoUseCase;
  final DeleteTodoUseCase deleteTodoUseCase;

  TodoListNotifier(
      {required this.fetchTodosUseCase,
      required this.addTodoUseCase,
      required this.updateTodoUseCase,
      required this.deleteTodoUseCase})
      : super([]) {
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    final todos = await fetchTodosUseCase();
    state = todos;
  }

  Future<void> addTodo(TodoModel todo) async {
    await addTodoUseCase(todo);
    state = [...state, todo];
  }

  Future<void> updateTodo(TodoModel updatedTodo) async {
    await updateTodoUseCase(updatedTodo);
    state = [
      for (final todo in state)
        if (todo.id == updatedTodo.id) updatedTodo else todo
    ];
  }

  Future<void> deleteTodo(String id) async {
    await deleteTodoUseCase(id);
    state = state.where((todo) => todo.id != id).toList();
  }
}

final todoListProvider =
    StateNotifierProvider<TodoListNotifier, List<TodoModel>>((ref) {
  final fetchTodosUseCase = ref.read(fetchTodosUseCaseProvider);
  final addTodoUseCase = ref.read(addTodoUseCaseProvider);
  final updateTodoUseCase = ref.read(updateTodoUseCaseProvider);
  final deleteTodoUseCase = ref.read(deleteTodoUseCaseProvider);

  return TodoListNotifier(
    fetchTodosUseCase: fetchTodosUseCase,
    addTodoUseCase: addTodoUseCase,
    updateTodoUseCase: updateTodoUseCase,
    deleteTodoUseCase: deleteTodoUseCase,
  );
});

final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  return TodoRepositoryImpl();
});
