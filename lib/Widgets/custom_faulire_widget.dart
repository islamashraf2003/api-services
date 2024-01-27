import 'package:flutter/material.dart';

class CustomFaulireWidget extends StatelessWidget {
  const CustomFaulireWidget({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessage));
  }
}
