import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:task_manager_app/ui/controllers/auth_cotroller.dart';

import '../models/network_response.dart';

class NetworkCaller {
  // ✅ GET Request
  static Future<NetworkResponse> getRequest(String url) async {
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'token': AuthController.accessToken,
      });

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedData,
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: 'Server Error: ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  // ✅ POST Request
  static Future<NetworkResponse> postRequest(String url, Map<String, dynamic> body) async {
    try {
      debugPrint(url);
      debugPrint(body.toString());
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'token': AuthController.accessToken,
        },
        body: jsonEncode(body),
      );
      debugPrint(response.toString());
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedData,
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: 'Server Error: ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }
}
