import 'package:api_app/Manager/user_cubit/user_state.dart';
import 'package:api_app/Repos/home_repo.dart';
import 'package:bloc/bloc.dart';

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
