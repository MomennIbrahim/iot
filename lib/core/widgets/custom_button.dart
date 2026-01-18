import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_test_app/core/config/app_palette.dart';
import 'package:iot_test_app/core/theming/app_color.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final ButtonStyle buttonStyle;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool isEnabled;

  const CustomButton._({
    required this.child,
    required this.onPressed,
    required this.buttonStyle,
    this.backgroundColor,
    this.borderColor,
    this.isEnabled = true,
  });

  CustomButton.filled({
    required Widget child,
    required VoidCallback onPressed,
    Color? backgroundColor,
    bool isEnabled = true,
  }) : this._(
         child: child,
         onPressed: onPressed,
         backgroundColor: backgroundColor ?? AppColor.mainColor,
         buttonStyle: ElevatedButton.styleFrom(
           padding: EdgeInsets.zero,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadiusGeometry.circular(12.0.r),
           ),
           backgroundColor: backgroundColor ?? AppColor.mainColor,
         ),
       );

  CustomButton.outlined({
    required VoidCallback onPressed,
    required child,
    Color? borderColor,
    bool isEnabled = true,
  }) : this._(
         child: child,
         backgroundColor: Colors.transparent,
         onPressed: onPressed,
         isEnabled: isEnabled,
         buttonStyle: OutlinedButton.styleFrom(
           padding: EdgeInsets.zero,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadiusGeometry.circular(12.0.r),
             side: BorderSide(
               color: borderColor ?? AppPalette.primaryColor,
               width: 2,
             ),
           ),
           backgroundColor: Colors.transparent,
           elevation: 0,
         ),
       );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: child,
    );
  }
}
