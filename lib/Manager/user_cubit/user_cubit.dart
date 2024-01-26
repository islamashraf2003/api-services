import 'package:api_app/Models/user.dart';
import 'package:api_app/Repos/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.homeRepo) : super(UserInitial());
  final HomeRepo homeRepo;
  Future<void> fetchUserData() async {
    emit(UserLoading());
    var data = await homeRepo.fetcUserInfo();
    data.fold(
        (failure) => {
              emit(
                UserFauiler(errorMessage: failure.errorMessage),
              ),
            }, (userData) {
      emit(
        UserSuccess(userData: userData),
      );
    });
  }
}
