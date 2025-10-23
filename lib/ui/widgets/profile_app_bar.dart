import 'package:flutter/material.dart';

import '../utility/app_colors.dart';
import 'network_cashed_image.dart';

AppBar profileAppBar() {
  return AppBar(
    backgroundColor: AppColors.themeColor,
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 10,
        child: NetworkCashedImage(
          url: '',
        ),
      ),
    ),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Dummy Name", style: TextStyle(
            fontSize: 16,
            color: Colors.white
        ),),
        Text("email@gmail.com", style: TextStyle(
            fontSize: 12,
            color:  Colors.white
        ),),
      ],
    ),
    actions: [
      IconButton(
          onPressed: (){},
          icon: Icon(Icons.logout)
      )
    ],
  );
}