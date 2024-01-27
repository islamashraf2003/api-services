import 'package:api_app/Models/user_model.dart';
import 'package:equatable/equatable.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserSuccess extends UserState {
  final List<User> userData;
  const UserSuccess({required this.userData});
}

final class UserLoading extends UserState {}

final class UserFauiler extends UserState {
  final String errorMessage;
  const UserFauiler({required this.errorMessage});
}
