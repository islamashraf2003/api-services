import 'package:flutter/material.dart';

class CustomHomeWidget extends StatelessWidget {
  const CustomHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      color: Colors.red,
      child: const Center(
        child: Text(
          "islam",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
