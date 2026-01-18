import 'package:flutter/material.dart';
import 'package:iot_test_app/core/error/error.dart';
import 'package:iot_test_app/core/helpers/extension.dart';


void showErrorDialog(AppFailure failure, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("خطأ", style: TextStyle(color: Colors.red)),
        content: Text(
          failure.errors != null
              ? failure.getAllError()
              : failure.message.toString(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text("حسناً"),
          ),
        ],
      );
    },
  );
}
