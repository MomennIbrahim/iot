import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Extension for Navigation
extension Navigation on BuildContext {
  Future<dynamic> push(Widget page) {
    return Navigator.of(
      this,
    ).push(MaterialPageRoute(builder: (context) => page));
  }

    Future<dynamic> pushAndRemoveUntil(Widget page) {
    return Navigator.of(
      this,
    ).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => page), (route) => false);
  }

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, arguments: arguments, predicate);
  }

  void pop() => Navigator.of(this).pop();
}

// Extension for responsive height and width
extension Distance on double {
  Widget get height => SizedBox(height: h);
  Widget get width => SizedBox(width: w);
}

extension NestedNavigation on GlobalKey<NavigatorState> {
  Future<void> push(Widget page) {
    return currentState?.push(MaterialPageRoute(builder: (context) => page)) ??
        Future.value();
  }

  Future<void> pushNamed(String routeName, {Object? arguments}) {
    return currentState?.pushNamed(routeName, arguments: arguments) ??
        Future.value();
  }

  Future<void> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return currentState?.pushNamedAndRemoveUntil(
          routeName,
          predicate,
          arguments: arguments,
        ) ??
        Future.value();
  }

  Future<void> pushReplacementNamed(String routeName, {Object? arguments}) {
    return currentState?.pushReplacementNamed(
          routeName,
          arguments: arguments,
        ) ??
        Future.value();
  }

  Future<void> pop() {
    return currentState?.maybePop() ?? Future.value();
  }
}

extension BorderRaidusExtension on num {
  BorderRadius get radius => BorderRadius.circular(toDouble().r);
 }