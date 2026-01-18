import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iot_test_app/core/di/di.dart';
import 'package:iot_test_app/core/routing/routes.dart';
import 'package:iot_test_app/features/auth/presentation/logic/cubit/auth_cubit.dart';
import 'package:iot_test_app/features/auth/presentation/screen/login_screen.dart';
import 'package:iot_test_app/features/auth/presentation/screen/register_screen.dart';
import 'package:iot_test_app/features/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:iot_test_app/screens/home_screen.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<AuthCubit>(),
            child: LoginScreen(),
          ),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case Routes.homeScreen:
       

        return MaterialPageRoute(builder: (_) => HomeScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text(
            "Screen not found",
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
