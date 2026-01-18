import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_test_app/core/config/app_palette.dart';
import 'package:iot_test_app/core/helpers/extension.dart';
import 'package:iot_test_app/core/routing/routes.dart';
import 'package:iot_test_app/core/widgets/app_button.dart';
import 'package:iot_test_app/core/widgets/custom_cherry_toast.dart';
import 'package:iot_test_app/core/widgets/custom_text_form_field.dart';
import 'package:iot_test_app/features/auth/presentation/logic/cubit/auth_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state.status == AuthStatus.loginFailure) {
                CustomCheryToast.showError(
                  context: context,
                  title: state.failure?.message ?? "حدث خطاء",
                );
              } else if (state.status == AuthStatus.loginSuccess) {
                Navigator.pushReplacementNamed(context, Routes.homeScreen);
              }
            },
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "تسجيل الدخول",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: AppPalette.primaryColor,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    CustomTextFormField(
                      textColor: AppPalette.primaryColor,
                      labelText: "البريد الإلكتروني",
                      hintText: "أدخل بريدك الإلكتروني",
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "البريد الإلكتروني مطلوب";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    16.0.height,
                    CustomTextFormField(
                      labelText: "كلمة المرور",
                      hintText: "أدخل كلمة المرور",
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "كلمة المرور مطلوبة";
                        }
                        return null;
                      },
                      enableObscureToggle: true,
                      obscureText: true,
                    ),
                    SizedBox(height: 32.h),
                    AppButton(
                      text: state.status == AuthStatus.loginLoading
                          ? "جاري الدخول..."
                          : "تسجيل الدخول",
                      onPressed: state.status == AuthStatus.loginLoading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthCubit>().login(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                );
                              }
                            },
                      borderColor: AppPalette.primaryColor,
                    ),
                    16.0.height,
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(Routes.registerScreen);
                      },
                      child: Text(
                        "ليس لديك حساب؟ سجل الآن",
                        style: TextStyle(
                          color: AppPalette.primaryColor,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
