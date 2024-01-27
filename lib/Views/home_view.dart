import 'dart:developer';

import 'package:api_app/Manager/add_new_user_cubit/add_new_user_state.dart';
import 'package:api_app/Widgets/custom_faulire_widget.dart';
import 'package:api_app/Widgets/custom_home_widget.dart';
import 'package:api_app/Widgets/custom_loading_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Manager/add_new_user_cubit/add_new_user_cubit.dart';

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
        body: BlocBuilder<AddNewUserCubit, AddNewUserState>(
          builder: (context, state) {
            if (state is AddNewUserSuccess) {
              return ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Center(
                      child: CustomHomeWidget(
                    userModel: state.user,
                  ));
                },
              );
            } else if (state is AddNewUserFaulire) {
              log(state.errorMessage);
              return CustomFaulireWidget(errorMessage: state.errorMessage);
            } else {
              return const CustomLoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
