class Urls {
  static const String _baseUrl = 'https://task.teamrabbil.com/api/v1';

  static const String registration = '$_baseUrl/registration';
  static const String login = '$_baseUrl/login';
  static const String createTask = '$_baseUrl/createTask';
  static const String newTask = '$_baseUrl/listTaskByStatus/New';
  static const String completedTask = '$_baseUrl/listTaskByStatus/Completed';
  static const String progressTask = '$_baseUrl/listTaskByStatus/Progress';
  static const String cancelledTask = '$_baseUrl/listTaskByStatus/Cancelled';
  static const String taskStatusCount = '$_baseUrl/taskStatusCount';

  // 🟢 Delete Task
  static String deleteTask(String id) => '$_baseUrl/deleteTask/$id';

  // 🟢 Update Task Status
  static String updateTaskStatus(String id, String newStatus) =>
      '$_baseUrl/updateTaskStatus/$id/$newStatus';
}
