import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_test_app/core/widgets/app_padding.dart';


void customBottomSheet({
  required BuildContext context,
  required Widget child,
  double? heightFactor,
  bool isDismissible = true,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: isDismissible,
    backgroundColor: Colors.transparent,
    showDragHandle: true,
    barrierColor: Colors.black.withAlpha(140),
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: heightFactor?.h ?? 0.25,
        child: Container(
          padding: paddingAll(20),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: child,
        ),
      );
    },
  );
}
