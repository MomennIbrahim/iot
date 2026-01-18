import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_test_app/core/config/app_palette.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.buttonColor,
    this.radius,
    this.height,
    this.width,
    this.textStyle,
    this.borderColor,
    this.padding,
    this.verticalPadding,
  });

  final String text;
  final void Function()? onPressed;
  final Color? buttonColor;
  final double? radius;
  final double? height;
  final double? width;
  final double? padding;
  final double? verticalPadding;
  final TextStyle? textStyle;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.w ?? double.infinity,
      height: height?.h ?? 55.0.h,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: padding?.w ?? 20.0.w,
          vertical: verticalPadding?.h ?? 0.0.h,
        ),
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              buttonColor ?? AppPalette.primaryColor,
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 30.0.r)),
            ),
            side: WidgetStatePropertyAll(
              BorderSide(
                color: borderColor ?? Colors.transparent,
              ),
            ),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(text,
                style: textStyle ??
                    TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    )),
          ),
        ),
      ),
    );
  }
}