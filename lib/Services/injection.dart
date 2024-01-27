import 'package:api_app/Manager/user_cubit/user_cubit.dart';
import 'package:api_app/Repos/home_immple.dart';
import 'package:api_app/Services/api_details.dart';
import 'package:api_app/Services/api_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<HomeImple>(() => HomeImple(getIt()));
  getIt.registerLazySingleton<ApiService>(() => ConcreteApiService.create());
  getIt.registerLazySingleton<UserCubit>(() => UserCubit(getIt()));
}
