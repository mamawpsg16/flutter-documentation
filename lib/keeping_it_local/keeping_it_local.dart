import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final taskController = TextEditingController();
  final taskBox = Hive.box('tasksBox');

  void addTask(String task) {
    taskBox.add(task); // store task in Hive
    taskController.clear();
    setState(() {}); // rebuild UI
  }

  void deleteTask(int index) {
    taskBox.deleteAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final tasks = taskBox.values.toList();
    return Scaffold(
      appBar: AppBar(title: Text('My Tasks')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: InputDecoration(hintText: 'Enter a task'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (taskController.text.trim().isNotEmpty) {
                      addTask(taskController.text.trim());
                    }
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (_, index) => ListTile(
                title: Text(tasks[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => deleteTask(index),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
