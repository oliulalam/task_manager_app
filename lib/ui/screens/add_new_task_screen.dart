import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/widgets/background_widget.dart';
import 'package:task_manager_app/ui/widgets/profile_app_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      body: BackggroundWidget(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50,),
                Text("Add New Task", style: Theme.of(context).textTheme.titleLarge,),
                SizedBox(height: 16,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Title'
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                      hintText: 'Description'
                  ),
                ),
                SizedBox(height: 16,),
                
                ElevatedButton(
                  onPressed: (){},
                  child: Text("Add"),
                )
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
