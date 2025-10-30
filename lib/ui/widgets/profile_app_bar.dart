import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/controllers/auth_cotroller.dart';
import 'package:task_manager_app/ui/screens/auth/sign_in_screen.dart';
import 'package:task_manager_app/ui/screens/auth/sign_up_screen.dart';
import 'package:task_manager_app/ui/screens/update_profile_screen.dart';

import '../utility/app_colors.dart';
import 'network_cashed_image.dart';

AppBar profileAppBar(context, [bool fromUpdateProfile = false]) {
  return AppBar(
    backgroundColor: AppColors.themeColor,
    leading: InkWell(
      onTap: (){
        if(fromUpdateProfile){
          return;
        }
        Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateProfileScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(radius: 10, child: NetworkCashedImage(url: '')),
      ),
    ),
    title: GestureDetector(
      onTap: (){
        if(fromUpdateProfile){
          return;
        }
        Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateProfileScreen()));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AuthController.userData?.fullName ?? "",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            AuthController.userData?.email ?? "",
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
        onPressed: () async{
          await AuthController.clearAllData();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => SignInScreen()),
            (route) => false,
          );
        },
        icon: Icon(Icons.logout, color: Colors.white,),
      ),
    ],
  );
}
