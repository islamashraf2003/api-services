import 'package:api_app/Manager/add_new_user_cubit/add_new_user_cubit.dart';
import 'package:api_app/Models/user_model.dart';
import 'package:api_app/Repos/home_immple.dart';
import 'package:api_app/Services/injection.dart';
import 'package:api_app/Views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AddNewUserCubit(
          getIt.get<HomeImple>(),
        )..addNewUser(
              newUser: const User(
            email: "ali@gmail.com",
            gender: "male",
            name: "mohammed ashraf",
            status: "Active",
          )),
        child: const HomeView(),
      ),
    );
  }
}
