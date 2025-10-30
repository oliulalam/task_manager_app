class NetworkResponse {
  final int statusCode;
  final bool isSuccess;
  final dynamic responseData;
  final String? errorMessage;


  NetworkResponse({
    required this.isSuccess,
    this.responseData,
    required this.statusCode,
    this.errorMessage = "Something went wrong"
  });
}