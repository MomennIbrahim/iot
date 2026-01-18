import 'package:dartz/dartz.dart';
import 'package:iot_test_app/core/error/error.dart';
import 'package:iot_test_app/core/networking/api_result.dart';

import '../models/user_model.dart';

abstract class AuthRepository {
 Future<Either<AppFailure, UserModel>> login({
    required String email,
    required String password,
  });
  Future<Either<AppFailure, UserModel>> register({
    required String name,
    required String email,
    required String password,
  });
}
