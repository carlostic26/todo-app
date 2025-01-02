import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/features/todo/data/model/todo_model.dart';
import 'dart:math';
import 'package:todo_app/features/todo/presentation/providers/provider.dart';

class AddTodoScreen extends ConsumerWidget {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newTodo = TodoModel(
                  id: Random().nextInt(10000).toString(),
                  title: _titleController.text,
                  description: _descriptionController.text,
                  isCompleted: false,
                );
                ref.read(todoListProvider.notifier).addTodo(newTodo);
                Navigator.pop(context);
              },
              child: const Text('Add Todo'),
            )
          ],
        ),
      ),
    );
  }
}
