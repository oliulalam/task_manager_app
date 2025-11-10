import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/widgets/task_item.dart';
import '../../data/models/network_response.dart';
import '../../data/models/task_list_wrapper_model.dart';
import '../../data/models/task_model.dart';
import '../../data/network_caller/network_caller.dart';
import '../../data/utlitles/urls.dart';
import '../widgets/snack_bar_message.dart';

class InProgressTaskScreen extends StatefulWidget {
  const InProgressTaskScreen({super.key});

  @override
  State<InProgressTaskScreen> createState() => _InProgressTaskScreenState();
}

class _InProgressTaskScreenState extends State<InProgressTaskScreen> {
  bool _getProgressTaskInProgress = false;
  List<TaskModel> progressTaskList = [];

  @override
  void initState() {
    super.initState();
    _getProgressTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          _getProgressTask();
        },
        child: Visibility(
          visible: _getProgressTaskInProgress == false,
          replacement: Center(child: CircularProgressIndicator()),
          child: ListView.builder(
            itemCount: progressTaskList.length,
            itemBuilder: (context, index) {
              return TaskItem(
                taskModel: progressTaskList[index],
                onUpdateTask: _getProgressTask,
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _getProgressTask() async {
    _getProgressTaskInProgress = true;
    if (mounted) setState(() {});

    NetworkResponse response = await NetworkCaller.getRequest(
      Urls.progressTask,
    );

    if (response.isSuccess) {
      TaskListWrapperModel taskListWrapperModel = TaskListWrapperModel.fromJson(
        response.responseData,
      );
      progressTaskList = taskListWrapperModel.taskList ?? [];
    } else {
      if (mounted) {
        showSnackBarMessage(
          context,
          response.errorMessage ?? 'Failed to load progress tasks!',
        );
      }
    }

    _getProgressTaskInProgress = false;
    if (mounted) setState(() {});
  }
}
