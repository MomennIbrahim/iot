import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_test_app/core/di/di.dart';
import 'package:iot_test_app/core/helpers/observe.dart';
import 'package:iot_test_app/core/local_storage/secure_storage.dart';
import 'package:iot_test_app/smart_home.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();

  SecureCache.secureCacheInit();

  setupServiceLocator();

  runApp(SmartHome());
}
