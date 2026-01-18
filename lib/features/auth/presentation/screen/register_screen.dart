import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot_test_app/core/config/app_palette.dart';
import 'package:iot_test_app/core/di/di.dart';
import 'package:iot_test_app/core/helpers/extension.dart';
import 'package:iot_test_app/core/routing/routes.dart';
import 'package:iot_test_app/core/widgets/app_button.dart';
import 'package:iot_test_app/core/widgets/custom_cherry_toast.dart';
import 'package:iot_test_app/core/widgets/custom_text_form_field.dart';
import 'package:iot_test_app/features/auth/presentation/logic/cubit/auth_cubit.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (_) => sl<AuthCubit>(),
      child: Scaffold(
        backgroundColor: AppPalette.background,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state.status == AuthStatus.registerSuccess) {
                  CustomCheryToast.showSuccess(
                    context: context,
                    title: "تم التسجيل بنجاح",
                  );
                  context.pushReplacementNamed(Routes.loginScreen);
                } else if (state.status == AuthStatus.registerFailure) {
                  CustomCheryToast.showError(
                    context: context,
                    title: state.failure?.message.toString() ?? "حدث خطاء",
                  );
                }
              },
              builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "تسجيل حساب جديد",
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                            color: AppPalette.primaryColor,
                          ),
                        ),
                        30.0.height,
                        CustomTextFormField(
                          prefixIcon: const Icon(Icons.person),
                          labelText: "الاسم",
                          hintText: "أدخل اسمك",
                          validator: (value) {
                            if (value!.isEmpty) return "يرجى ادخال الاسم";
                            return null;
                          },
                          controller: _nameController,
                        ),
                        16.0.height,
                        CustomTextFormField(
                          prefixIcon: const Icon(Icons.email),
                          labelText: "البريد الإلكتروني",
                          hintText: "أدخل بريدك الإلكتروني",
                          validator: (value) {
                            if (value!.isEmpty)
                              return "يرجى ادخال بريد الكتروني";
                            return null;
                          },
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        16.0.height,
                        CustomTextFormField(
                          suffixIcon: const Icon(Icons.remove_red_eye),
                          prefixIcon: const Icon(Icons.lock),
                          labelText: "كلمة المرور",
                          hintText: "أدخل كلمة المرور",
                          validator: (value) {
                            if (value!.isEmpty) return "يرجى ادخال كلمة المرور";
                            return null;
                          },
                          enableObscureToggle: true,
                          controller: _passwordController,
                          obscureText: true,
                        ),
                        26.0.height,
                        AppButton(
                          text: state.status == AuthStatus.registerLoading
                              ? "جارٍ التسجيل..."
                              : "تسجيل حساب جديد",
                          onPressed: state.status == AuthStatus.registerLoading
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<AuthCubit>().register(
                                      name: _nameController.text,
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    );
                                  }
                                },
                          borderColor: AppPalette.primaryColor,
                        ),
                        16.0.height,
                        GestureDetector(
                          onTap: () {
                            context.pushReplacementNamed(Routes.loginScreen);
                          },
                          child: Text(
                            "لديك حساب بالفعل؟ سجل دخول",
                            style: TextStyle(
                              color: AppPalette.primaryColor,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
