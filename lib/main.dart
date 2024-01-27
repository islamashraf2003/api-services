import 'package:api_app/Manager/cubituser_info_by_id_Cubit/use_info_by_id_cubit.dart';
import 'package:api_app/Manager/user_cubit/user_cubit.dart';
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
        create: (context) => UseInfoByIdCubit(
          getIt.get<HomeImple>(),
        )..fetchUserInfoByid(userId: 6079306),
        child: const HomeView(),
      ),
    );
  }
}
