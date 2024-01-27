import 'dart:developer';

import 'package:api_app/Manager/cubituser_info_by_id_Cubit/use_info_by_id_cubit.dart';
import 'package:api_app/Manager/cubituser_info_by_id_Cubit/use_info_by_id_state.dart';
import 'package:api_app/Manager/user_cubit/user_cubit.dart';
import 'package:api_app/Manager/user_cubit/user_state.dart';
import 'package:api_app/Widgets/custom_faulire_widget.dart';
import 'package:api_app/Widgets/custom_home_widget.dart';
import 'package:api_app/Widgets/custom_loading_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        body: BlocBuilder<UseInfoByIdCubit, UseInfoByIdState>(
          builder: (context, state) {
            if (state is UseInfoByIdSuccess) {
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
            } else if (state is UseInfoByIdFaulire) {
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
