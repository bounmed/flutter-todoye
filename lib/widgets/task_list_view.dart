import 'package:flutter/material.dart';
import 'task_list_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoye/models/task_data.dart';

class TaskListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
            itemCount: taskData.taskCount,
            itemBuilder: (context, index) {
              return TaskListTile(
                taskTitle: taskData.tasks[index].name,

                isChecked: taskData.tasks[index].isDone,
                checkboxCallback: (checkboxState) {
                  taskData.updateTask(taskData.tasks[index]);
                },
                deleteCallback: () {
                  taskData.deleteTask(taskData.tasks[index]);
                },
              );
            });
      },
    );
  }
}
