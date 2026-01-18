import 'package:dartz/dartz.dart';
import 'package:iot_test_app/core/error/error.dart';
import 'package:iot_test_app/core/networking/api_service.dart';
import 'package:iot_test_app/core/networking/end_points.dart';

import '../models/user_model.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiService apiService;

  AuthRepositoryImpl({required this.apiService});

  @override
  Future<Either<AppFailure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiService.postData(
        endPoint: EndPoints.login,
        data: {'email': email, 'password': password},
      );

      if (response['user'] != null && response['token'] != null) {
        final user = UserModel.fromJson(response['user']);
        user.token = response['token'];
        return Right(user); // نجاح
      } else {
        return Left(
          RemoteServerFailure(response['message'] ?? "خطأ غير معروف"),
        );
      }
    } catch (e) {
      return Left(RemoteServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, UserModel>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiService.postData(
        endPoint: EndPoints.register,
        data: {'name': name, 'email': email, 'password': password},
      );

      if (response['user'] != null && response['token'] != null) {
        final user = UserModel.fromJson(response['data']);
        return Right(user);
      } else {
        return Left(
          RemoteServerFailure(response['message'] ?? "خطأ غير معروف"),
        );
      }
    } catch (e) {
      return Left(RemoteServerFailure(e.toString()));
    }
  }
}
