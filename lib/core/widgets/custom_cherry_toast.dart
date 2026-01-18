import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';

class CustomCheryToast {
  static void showSuccess({
    required BuildContext context,
    required String title,
    String? description,
    bool autoDismiss = true,
  }) {
    CherryToast.success(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      description: description != null ? Text(description) : null,
      animationType: AnimationType.fromTop,
      autoDismiss: autoDismiss,
    ).show(context);
  }

  static void showError({
    required BuildContext context,
    required String title,
    String? description,
  }) {
    CherryToast.error(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      description: description != null ? Text(description) : null,
      animationType: AnimationType.fromTop,
      autoDismiss: true,
    ).show(context);
  }

  static void showWarning({
    required BuildContext context,
    required String title,
    String? description,
  }) {
    CherryToast.warning(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      description: description != null ? Text(description) : null,
      animationType: AnimationType.fromTop,
      autoDismiss: true,
    ).show(context);
  }

  static void showInfo({
    required BuildContext context,
    required String title,
    String? description,
  }) {
    CherryToast.info(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      description: description != null ? Text(description) : null,
      animationType: AnimationType.fromTop,
      autoDismiss: true,
    ).show(context);
  }
}
