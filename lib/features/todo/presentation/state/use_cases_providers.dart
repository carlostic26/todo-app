import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/features/todo/domain/usecases/add_todo.dart';
import 'package:todo_app/features/todo/domain/usecases/delete_todo.dart';
import 'package:todo_app/features/todo/domain/usecases/fetch_todo.dart';
import 'package:todo_app/features/todo/domain/usecases/update_todo.dart';
import 'package:todo_app/features/todo/presentation/state/provider.dart';

//Inyeccion de dependencias para los casos de uso

final fetchTodosUseCaseProvider = Provider<FetchTodosUseCase>((ref) {
  final repository = ref.read(todoRepositoryProvider);
  return FetchTodosUseCase(repository);
});

final addTodoUseCaseProvider = Provider<AddTodoUseCase>((ref) {
  final repository = ref.read(todoRepositoryProvider);
  return AddTodoUseCase(repository);
});

final updateTodoUseCaseProvider = Provider<UpdateTodoUseCase>((ref) {
  final repository = ref.read(todoRepositoryProvider);
  return UpdateTodoUseCase(repository);
});

final deleteTodoUseCaseProvider = Provider<DeleteTodoUseCase>((ref) {
  final repository = ref.read(todoRepositoryProvider);
  return DeleteTodoUseCase(repository);
});
