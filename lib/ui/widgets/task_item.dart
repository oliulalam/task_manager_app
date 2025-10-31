import 'package:flutter/material.dart';
import 'package:task_manager_app/data/models/task_model.dart';
class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key, required this.taskModel,
  });

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: ListTile(
        title: Text(taskModel.title ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(taskModel.description ?? ''),
            Text(
              "Date: ${taskModel.createdDate ?? DateTime.now().toString()}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(taskModel.status ?? 'New', style: TextStyle(color: Colors.white),),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  backgroundColor: Colors.blue,
                ),
                ButtonBar(
                  children: [
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.delete)
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.edit)
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}