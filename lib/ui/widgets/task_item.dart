import 'package:flutter/material.dart';
class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: ListTile(
        title: Text("Title will be here"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Description will be here"),
            Text(
              "Date: 23/10/2025",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text("New", style: TextStyle(color: Colors.white),),
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