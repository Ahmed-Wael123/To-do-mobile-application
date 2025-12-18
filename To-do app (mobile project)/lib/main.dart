// Simple ToDo App
// Covers: StatefulWidget, setState, List, TextField, ListView, GestureDetector

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      home: const TodoPage(),
    );
  }
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  // List to store tasks
  List<String> tasks = [];

  // Controller to read input text
  TextEditingController taskController = TextEditingController();

  // Function to add task
  void addTask() {
    if (taskController.text.isNotEmpty) {
      setState(() {
        tasks.add(taskController.text);
        taskController.clear();
      });
    }
  }

  // Function to remove task
  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Input Field
            TextField(
              controller: taskController,
              decoration: const InputDecoration(
                labelText: 'Enter task',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            // Add Button
            ElevatedButton(
              onPressed: addTask,
              child: const Text('Add Task'),
            ),

            const SizedBox(height: 20),

            // Tasks List
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(tasks[index]),
                      trailing: GestureDetector(
                        onTap: () => removeTask(index),
                        child: const Icon(Icons.delete, color: Colors.red),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
