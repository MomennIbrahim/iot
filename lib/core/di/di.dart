import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:iot_test_app/core/helpers/secure_cache_helper.dart';
import 'package:iot_test_app/core/networking/api_service.dart';
import 'package:iot_test_app/cubits/cubit/living_room_cubit.dart';
import 'package:iot_test_app/features/auth/data/repo/auth_repository.dart';
import 'package:iot_test_app/features/auth/data/repo/auth_repository_impl.dart';
import 'package:iot_test_app/features/auth/presentation/logic/cubit/auth_cubit.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // ===== External =====
  sl.registerLazySingleton<Dio>(() => Dio());

  sl.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  // ===== Core =====
  sl.registerLazySingleton<SecureCacheHelper>(() => SecureCacheHelper());

  sl.registerLazySingleton<ApiService>(() => ApiService(sl(), sl()));

  // ===== Auth =====
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(apiService: sl()),
  );

  sl.registerFactory<AuthCubit>(() => AuthCubit(sl()));
  sl.registerFactory<LivingRoomCubit>(() => LivingRoomCubit(sl()));
}

void disposeServiceLocator() => sl.reset();

void resetServiceLocator() => sl.reset();
