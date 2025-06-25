import 'package:flutter/material.dart';

enum TaskStatus { inProgress, pending, completed, holdOn }

class Task {
  final String title;
  TaskStatus status;

  Task(this.title, {this.status = TaskStatus.pending});
}

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final List<Task> _tasks = [
    Task('Finish the Flutter UI', status: TaskStatus.inProgress),
    Task('Push code to GitHub', status: TaskStatus.pending),
    Task('Review pull requests', status: TaskStatus.holdOn),
    Task('Update documentation', status: TaskStatus.completed),
  ];

  void _addTask() {
    setState(() {
      _tasks.add(Task("New Task #${_tasks.length + 1}"));
    });
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  String getStatusLabel(TaskStatus status) {
    switch (status) {
      case TaskStatus.inProgress:
        return "In Progress";
      case TaskStatus.pending:
        return "Pending";
      case TaskStatus.completed:
        return "Completed";
      case TaskStatus.holdOn:
        return "Hold On";
    }
  }

  Color getStatusColor(TaskStatus status, BuildContext context) {
    switch (status) {
      case TaskStatus.inProgress:
        return Colors.orange;
      case TaskStatus.pending:
        return Colors.blueGrey;
      case TaskStatus.completed:
        return Colors.green;
      case TaskStatus.holdOn:
        return Colors.redAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Tasks"),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _tasks.isEmpty
            ? const Center(
                child: Text(
                  "No tasks yet. Add one!",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
            : ListView.separated(
                itemCount: _tasks.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final task = _tasks[index];
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(task.title),
                      subtitle: Text(
                        getStatusLabel(task.status),
                        style: TextStyle(
                          color: getStatusColor(task.status, context),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: PopupMenuButton<TaskStatus>(
                        initialValue: task.status,
                        icon: const Icon(Icons.more_vert),
                        onSelected: (status) {
                          setState(() {
                            task.status = status;
                          });
                        },
                        itemBuilder: (context) => TaskStatus.values
                            .map(
                              (status) => PopupMenuItem(
                                value: status,
                                child: Text(getStatusLabel(status)),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addTask,
        icon: const Icon(Icons.add),
        label: const Text("Add Task"),
      ),
    );
  }
}
