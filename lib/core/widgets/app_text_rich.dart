import 'package:flutter/material.dart';
import 'package:iot_test_app/core/theming/app_color.dart';
import 'package:iot_test_app/core/theming/app_text_style.dart';

 

class AppTextRich extends StatelessWidget {
  final String normalText;
  final String highlightedText;
  final TextStyle? normalStyle;
  final TextStyle? highlightedStyle;
  final bool isLineThrough;

  const AppTextRich({
    super.key,
    required this.normalText,
    required this.highlightedText,
    this.normalStyle,
    this.highlightedStyle,
    this.isLineThrough = false,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: normalText,
            style:
                normalStyle ??
                AppTextStyle.font14W500.copyWith(color: AppColor.blackColor),
          ),
          TextSpan(
            text: highlightedText,
            style:
                highlightedStyle ??
                AppTextStyle.font14W500.copyWith(
                  color: Colors.grey,
                  decoration: isLineThrough ? TextDecoration.lineThrough : null,
                ),
          ),
        ],
      ),
    );
  }
}
