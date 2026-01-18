import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_test_app/core/routing/app_router.dart';
import 'package:iot_test_app/core/routing/routes.dart';

class SmartHome extends StatelessWidget {
  const SmartHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      child: MaterialApp(
        title: 'Flutter IOT App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black26,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
