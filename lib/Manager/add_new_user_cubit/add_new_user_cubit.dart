import 'package:api_app/Manager/add_new_user_cubit/add_new_user_state.dart';
import 'package:api_app/Models/user_model.dart';
import 'package:api_app/Repos/home_repo.dart';
import 'package:bloc/bloc.dart';

class AddNewUserCubit extends Cubit<AddNewUserState> {
  AddNewUserCubit(this.homeRepo) : super(AddNewUserInitial());
  HomeRepo homeRepo;
  Future<void> addNewUser({required User newUser, String? token}) async {
    emit(AddNewUserLoading());
    var data = await homeRepo.addNewUser(newUser: newUser);
    data.fold((falire) {
      emit(AddNewUserFaulire(errorMessage: falire.errorMessage));
    }, (newUser) {
      emit(AddNewUserSuccess(user: newUser));
    });
  }
}
