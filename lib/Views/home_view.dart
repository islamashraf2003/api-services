import 'package:api_app/Widgets/custom_home_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Api"),
        ),
        body: const Center(child: CustomHomeWidget()),
      ),
    );
  }
}
