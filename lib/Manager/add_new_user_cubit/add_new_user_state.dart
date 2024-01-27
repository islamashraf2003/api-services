import 'package:equatable/equatable.dart';

import '../../Models/user_model.dart';

sealed class AddNewUserState extends Equatable {
  const AddNewUserState();

  @override
  List<Object> get props => [];
}

final class AddNewUserInitial extends AddNewUserState {}

final class AddNewUserLoading extends AddNewUserState {}

final class AddNewUserSuccess extends AddNewUserState {
  final User user;
  const AddNewUserSuccess({required this.user});
}

final class AddNewUserFaulire extends AddNewUserState {
  final String errorMessage;

  const AddNewUserFaulire({required this.errorMessage});
}
