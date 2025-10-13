import 'package:flutter/material.dart';
import '../models/task.dart';
import 'task_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> _tasks = [];
  String _selectedFilter = 'All';

  void _addTask(Task task) {
    setState(() {
      _tasks.add(task);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Task added successfully!')),
    );
  }

  void _toggleTask(int id) {
    setState(() {
      final task = _tasks.firstWhere((t) => t.id == id);
      task.isDone = !task.isDone;
    });
  }

  void _deleteTask(int id) {
    setState(() {
      _tasks.removeWhere((t) => t.id == id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Task deleted')),
    );
  }

  void _goToAddTask(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TaskDetailScreen()),
    );
    if (result != null && result is Task) {
      _addTask(result);
    }
  }

  void _editTask(BuildContext context, Task task) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => TaskDetailScreen(task: task)),
    );

    if (result != null && result is Task) {
      setState(() {
        final index = _tasks.indexWhere((t) => t.id == task.id);
        if (index != -1) _tasks[index] = result;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Task updated')),
      );
    }
  }

  Color _getPriorityColor(Priority p) {
    switch (p) {
      case Priority.high:
        return Colors.redAccent;
      case Priority.medium:
        return Colors.orangeAccent;
      case Priority.low:
        return Colors.green;
    }
  }

  IconData _getPriorityIcon(Priority p) {
    switch (p) {
      case Priority.high:
        return Icons.priority_high;
      case Priority.medium:
        return Icons.trending_up;
      case Priority.low:
        return Icons.low_priority;
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredTasks = _tasks
        .where(
          (t) => _selectedFilter == 'All' || t.category == _selectedFilter,
    )
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          '🗒️ My Task Manager',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                dropdownColor: Colors.white,
                value: _selectedFilter,
                items: ['All', 'Work', 'Personal', 'Project']
                    .map(
                      (c) => DropdownMenuItem(
                    value: c,
                    child: Text(
                      c,
                      style: const TextStyle(color: Colors.black87),
                    ),
                  ),
                )
                    .toList(),
                onChanged: (val) {
                  setState(() => _selectedFilter = val!);
                },
                icon: const Icon(Icons.filter_list, color: Colors.white),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.sort_rounded, color: Colors.white),
            tooltip: 'Sort by priority',
            onPressed: () {
              setState(() {
                _tasks.sort(
                      (a, b) => b.priority.index.compareTo(a.priority.index),
                );
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Sorted by priority (High → Low)')),
              );
            },
          ),
        ],
      ),
      body: filteredTasks.isEmpty
          ? Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.inbox_rounded,
                  size: 90, color: Colors.grey),
              const SizedBox(height: 20),
              Text(
                'No tasks yet!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Tap the + button to add your first task.',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: filteredTasks.length,
        itemBuilder: (context, index) {
          final t = filteredTasks[index];
          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: t.isDone
                  ? Colors.greenAccent.withValues(alpha: 0.15)
                  : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 10),
              leading: IconButton(
                icon: Icon(
                  t.isDone
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                  color: t.isDone
                      ? Colors.green
                      : _getPriorityColor(t.priority),
                ),
                onPressed: () => _toggleTask(t.id),
              ),
              title: Text(
                t.title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  decoration: t.isDone
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (t.description != null && t.description!.isNotEmpty)
                    Text(
                      t.description!,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        _getPriorityIcon(t.priority),
                        color: _getPriorityColor(t.priority),
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        t.priority.name.toUpperCase(),
                        style: TextStyle(
                          color: _getPriorityColor(t.priority),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          t.category ?? 'No Category',
                          style: const TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon:
                    const Icon(Icons.edit, color: Colors.blueAccent),
                    onPressed: () => _editTask(context, t),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteTask(t.id),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _goToAddTask(context),
        label: const Text('Add Task'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
