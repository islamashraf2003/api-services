import 'package:api_app/Repos/home_repo.dart';
import 'package:bloc/bloc.dart';

import 'use_info_by_id_state.dart';

class UseInfoByIdCubit extends Cubit<UseInfoByIdState> {
  UseInfoByIdCubit(this.homeRepo) : super(UseInfoByIdInitial());
  HomeRepo homeRepo;
  Future<void> fetchUserInfoByid({required int userId}) async {
    emit(UseInfoByIdLoading());
    var data = await homeRepo.fetcUserById(userId: userId);
    data.fold(
        (faulire) => {
              emit(UseInfoByIdFaulire(errorMessage: faulire.errorMessage)),
            }, (user) {
      emit(
        UseInfoByIdSuccess(user: user),
      );
    });
  }
}
