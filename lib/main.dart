import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/core/theme/theme_manager.dart';
import 'package:todo_app/core/theme/theme_notifier.dart';
import 'package:todo_app/features/todo/presentation/screens/todo_list_screen.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  void main() {
    runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider);

    return MaterialApp(
      title: 'Todo App',
      theme: isDarkMode ? ThemeManager.darkTheme : ThemeManager.lightTheme,
      home: const TodoListScreen(),
    );
  }
}
