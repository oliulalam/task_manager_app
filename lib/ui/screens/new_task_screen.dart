import 'package:flutter/material.dart';
import 'package:task_manager_app/data/models/network_response.dart';
import 'package:task_manager_app/data/models/task_list_wrapper_model.dart';
import 'package:task_manager_app/data/models/task_model.dart';
import 'package:task_manager_app/data/network_caller/network_caller.dart';
import 'package:task_manager_app/data/utlitles/urls.dart';
import 'package:task_manager_app/ui/screens/add_new_task_screen.dart';
import 'package:task_manager_app/ui/utility/app_colors.dart';
import 'package:task_manager_app/ui/widgets/snack_bar_message.dart';
import '../widgets/new_task_summary_card.dart';
import '../widgets/task_item.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool _getNewTaskInProgress = false;

  List<TaskModel> newTaskList = [];

  @override
  void initState() {
    super.initState();
    _getNewTaks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Column(
          children: [
            _buildSummarySection(),
            SizedBox(height: 8),
            Expanded(
              child: RefreshIndicator(
                onRefresh: ()async{
                  _getNewTaks();
                },
                child: Visibility(
                  visible: _getNewTaskInProgress == false,
                  replacement: Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: ListView.builder(
                    itemCount: newTaskList.length,
                    itemBuilder: (context, index) {
                      return TaskItem(taskModel: newTaskList[index],);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _onTabAddButton,
        backgroundColor: AppColors.themeColor,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }

  void _onTabAddButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddNewTaskScreen()),
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

  Future<void> _getNewTaks() async {
    _getNewTaskInProgress = true;
    if (mounted) {
      setState(() {});
    }

    NetworkResponse response = await NetworkCaller.getRequest(Urls.newTask);

    if (response.isSuccess) {
      TaskListWrapperModel taskListWrapperModel = TaskListWrapperModel.fromJson(
        response.responseData,
      );
      newTaskList = taskListWrapperModel.taskList ?? [];

    }else{
      if(mounted){
        showSnackBarMessage(context, response.errorMessage ?? 'Get new task failed! Try again');
      }
    }
    _getNewTaskInProgress = false;
    if(mounted){
      setState(() {

      });
    }
  }
}
