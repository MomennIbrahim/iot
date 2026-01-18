import 'package:flutter/material.dart';

class TextStylesManager {
  TextStylesManager._(); // Private constructor => prevent instantiation

  /// ----------------------------
  /// Headlines
  /// ----------------------------
  static TextStyle headline1({Color? color}) => TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: color ?? Colors.white,
  );

  static TextStyle headline2({Color? color}) => TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: color ?? Colors.white70,
  );

  static TextStyle headline3({Color? color}) => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: color ?? Colors.white70,
  );

  /// ----------------------------
  /// Body Text
  /// ----------------------------
  static TextStyle bodyLarge({Color? color}) => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: color ?? Colors.white70,
  );

  static TextStyle bodyMedium({Color? color}) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: color ?? Colors.white60,
  );

  static TextStyle bodySmall({Color? color}) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: color ?? Colors.white54,
  );

  /// ----------------------------
  /// Buttons
  /// ----------------------------
  static TextStyle button({Color? color}) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: color ?? Colors.white,
    letterSpacing: 1.2,
  );

  /// ----------------------------
  /// Captions
  /// ----------------------------
  static TextStyle caption({Color? color}) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: color ?? Colors.white54,
  );
}
