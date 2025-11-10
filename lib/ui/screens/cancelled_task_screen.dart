import 'package:flutter/material.dart';
import 'package:task_manager_app/data/models/network_response.dart';
import 'package:task_manager_app/data/models/task_list_wrapper_model.dart';
import 'package:task_manager_app/data/models/task_model.dart';
import 'package:task_manager_app/data/network_caller/network_caller.dart';
import 'package:task_manager_app/data/utlitles/urls.dart';
import 'package:task_manager_app/ui/widgets/snack_bar_message.dart';

import '../widgets/profile_app_bar.dart';
import '../widgets/task_item.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key});

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {

  bool _getCancelledInProgress = false;
  List<TaskModel> cancelledTaskList = [];

  @override
  void initState() {

    super.initState();
    _getCancelledTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          _getCancelledTask();
        },
        child: Visibility(
          visible: _getCancelledInProgress == false,
          replacement: Center(
            child: CircularProgressIndicator(),
          ),
          child: ListView.builder(
            itemCount: cancelledTaskList.length,
            itemBuilder: (context, index){
              return TaskItem(
                taskModel: cancelledTaskList[index],
                  onUpdateTask: _getCancelledTask,
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _getCancelledTask() async {

    _getCancelledInProgress = true;
    if(mounted){
      setState(() {

      });
    }

    NetworkResponse response = await NetworkCaller.getRequest(Urls.cancelledTask);
    if(response.isSuccess){

      TaskListWrapperModel taskListWrapperModel = TaskListWrapperModel.fromJson(response.responseData);
      cancelledTaskList = taskListWrapperModel.taskList ?? [];

    }else{
      if(mounted){
        showSnackBarMessage(context, response.errorMessage ?? 'Failed to load cancelled tasks');
      }
    }

    _getCancelledInProgress = false;
    if(mounted){
      setState(() {

      });
    }

  }

}
