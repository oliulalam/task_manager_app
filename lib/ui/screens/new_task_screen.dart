import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/utility/app_colors.dart';
import 'package:task_manager_app/ui/widgets/network_cashed_image.dart';

import '../widgets/new_task_summary_card.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/task_item.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Column(
          children: [
            _buildSummarySection(),
            SizedBox(height: 8,),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return TaskItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummarySection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          TaskSummaryCard(count: '13', title: 'New Task'),
          TaskSummaryCard(count: '34', title: 'Completed'),
          TaskSummaryCard(count: '15', title: 'In Progress'),
          TaskSummaryCard(count: '23', title: 'Cancelled'),
        ],
      ),
    );
  }
}


