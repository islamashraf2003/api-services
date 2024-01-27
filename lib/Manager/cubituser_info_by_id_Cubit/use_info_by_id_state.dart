import 'package:equatable/equatable.dart';

import '../../Models/user_model.dart';

sealed class UseInfoByIdState extends Equatable {
  const UseInfoByIdState();

  @override
  List<Object> get props => [];
}

final class UseInfoByIdInitial extends UseInfoByIdState {}

final class UseInfoByIdLoading extends UseInfoByIdState {}

final class UseInfoByIdSuccess extends UseInfoByIdState {
  final User user;
  const UseInfoByIdSuccess({required this.user});
}

final class UseInfoByIdFaulire extends UseInfoByIdState {
  final String errorMessage;

  const UseInfoByIdFaulire({required this.errorMessage});
}
