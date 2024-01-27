import 'package:api_app/Models/user_model.dart';
import 'package:api_app/Repos/home_repo.dart';
import 'package:api_app/Services/api_service.dart';
import 'package:api_app/Utils/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeImple extends HomeRepo {
  ApiService apiService;
  HomeImple(this.apiService);
  @override
  Future<Either<Failure, List<User>>> fetcUserInfo() async {
    try {
      var result = await apiService.get(endPoint: 'users');
      List<User> userData = (result as List)
          .map(
            (json) => User.fromJson(json as Map<String, dynamic>),
          )
          .toList();
      return Right(userData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, User>> fetcUserById({required int userId}) async {
    try {
      var result = await apiService.getUserById(userId: userId);
      return right(User.fromJson(result));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
