import 'package:flutter/material.dart';
import 'package:task_manager_app/data/models/network_response.dart';
import 'package:task_manager_app/data/network_caller/network_caller.dart';
import 'package:task_manager_app/data/utlitles/urls.dart';
import 'package:task_manager_app/ui/widgets/background_widget.dart';
import 'package:task_manager_app/ui/widgets/profile_app_bar.dart';
import 'package:task_manager_app/ui/widgets/snack_bar_message.dart';

import '../controllers/auth_cotroller.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _addNewTaskInPorogress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      body: BackggroundWidget(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Text(
                    "Add New Task",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _titleTEController,
                    decoration: InputDecoration(hintText: 'Title'),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter your title';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _descriptionTEController,
                    maxLines: 4,
                    decoration: InputDecoration(hintText: 'Description'),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter your description';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  Visibility(
                    visible: _addNewTaskInPorogress == false,
                    replacement: Center(child: CircularProgressIndicator()),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          debugPrint('Access Token: ${AuthController.accessToken}');
                          _addNewTask();
                        }
                      },
                      child: Text("Add"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _addNewTask() async {
    _addNewTaskInPorogress = true;
    if (mounted) {
      setState(() {});
    }

    Map<String, dynamic> requestData = {
      "title": _titleTEController.text.trim(),
      "description": _descriptionTEController.text,
      "status": "New",
    };

    NetworkResponse response = await NetworkCaller.postRequest(
      Urls.createTask,
      requestData,
    );

    _addNewTaskInPorogress = false;
    if (mounted) {
      setState(() {});
    }

    if (response.isSuccess) {
      _clearTextFields();
      if (mounted) {
        showSnackBarMessage(context, 'New task added');
      }
    } else {
      if (mounted) {
        showSnackBarMessage(context, 'New task add failed! try again', true);
      }
    }
  }

  void _clearTextFields() {
    _titleTEController.clear();
    _descriptionTEController.clear();
  }
}
