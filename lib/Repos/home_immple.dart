import 'package:api_app/Models/user.dart';
import 'package:api_app/Repos/home_repo.dart';
import 'package:api_app/Services/api_sercie.dart';
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
            (json) => User.usersFromJson(json as Map<String, dynamic>),
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
}
