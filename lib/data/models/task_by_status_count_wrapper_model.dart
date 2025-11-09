import 'package:task_manager_app/data/models/task_count_by_status_model.dart';

class TaskCountStatusWrapperModel {
  String? status;
  List<TaskCountByStatusModel>? taskCountByStatusList;

  TaskCountStatusWrapperModel({this.status, this.taskCountByStatusList});

  TaskCountStatusWrapperModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      taskCountByStatusList = <TaskCountByStatusModel>[];
      json['data'].forEach((v) {
        taskCountByStatusList!.add(TaskCountByStatusModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (taskCountByStatusList != null) {
      data['data'] = taskCountByStatusList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

