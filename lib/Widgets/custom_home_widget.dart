import 'package:api_app/Models/user_model.dart';
import 'package:flutter/material.dart';

class CustomHomeWidget extends StatelessWidget {
  const CustomHomeWidget({super.key, required this.userModel});
  final User userModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 300,
      color: Colors.red,
      child: Center(
        child: Text(
          userModel.name ?? "unKown",
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
