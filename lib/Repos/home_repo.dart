import 'package:api_app/Models/user_model.dart';
import 'package:api_app/Utils/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<User>>> fetcUserInfo();
  Future<Either<Failure, User>> fetcUserById({required int userId});
}
