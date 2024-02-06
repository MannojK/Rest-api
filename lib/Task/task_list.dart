import 'package:flutter/material.dart';
import 'package:prof_rest_api/Task/api_service.dart';
import 'package:prof_rest_api/Task/task_model..dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  late Future<List<Task>> _tasksFuture;

  @override
  void initState() {
    super.initState();
    _tasksFuture = ApiService.fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
      ),
      body: FutureBuilder<List<Task>>(
        future: _tasksFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const  Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final tasks = snapshot.data;

            return ListView.builder(
              itemCount: tasks!.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ListTile(
                  title: Text(task.title),
                  trailing: Checkbox(
                    value: task.completed,
                    onChanged: (value) {
                      setState(() {
                        task.completed = value!;
                        ApiService.updateTask(task);
                      });
                    },
                  ),
                  onLongPress: () {
                    ApiService.deleteTask(task.id)
                      .then((_) {
                        setState(() {
                          tasks.removeAt(index);
                        });
                      })
                      .catchError((error) {
                        print('Delete error: $error');
                      });
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTask = Task(id: 0, title: 'New Task', completed: false);
          final createdTask = await ApiService.createTask(newTask);
          setState(() {
            _tasksFuture = ApiService.fetchTasks();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
