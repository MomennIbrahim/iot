import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_test_app/core/theming/app_color.dart';


class AppTextStyle {
  static TextStyle font12W400Grey = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12.0.sp,
    color: Colors.grey,
  );

    static TextStyle font12W500MainColor = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12.0.sp,
    color: AppColor.mainColor,
  );
  static TextStyle font14W500 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14.0.sp,
  );

  static TextStyle font14W700White = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14.0.sp,
    color: AppColor.whiteColor,
  );
  static TextStyle font16W400 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16.0.sp,
  );
  static TextStyle font16W700 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16.0.sp,
  );
  static TextStyle font20W400MainColor = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 20.0.sp,
    color: AppColor.mainColor,
  );
  static TextStyle font20W700 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20.0.sp,
  );
  static TextStyle font20W700PendingColor = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20.0.sp,
    color: AppColor.pendingColor,
  );
  static TextStyle font24W400MainColor = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 24.0.sp,
    color: AppColor.mainColor,
  );
}
