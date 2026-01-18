import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iot_test_app/core/config/app_palette.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final bool obscureText;
  final bool enabled;
  final void Function()? onTap;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget Function(BuildContext, EditableTextState)? contextMenuBuilder;
  final Color? textColor;
  const CustomTextFormField(
      {super.key,
      required this.labelText,
      required this.hintText,
      this.obscureText = false,
      required this.controller,
      this.validator,
      this.keyboardType,
      this.inputFormatters,
      this.onTap,
      this.enabled = true,
      this.contextMenuBuilder,
      this.prefixIcon,
      this.suffixIcon, this.textColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      contextMenuBuilder: contextMenuBuilder,
      enabled: enabled,
      onTap: onTap,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      cursorColor: AppPalette.whiteColor,
      style: Theme.of(context)
          .textTheme
          .titleSmall
          ?.copyWith(color: textColor ?? AppPalette.whiteColor),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        errorStyle: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: AppPalette.errorColor),
        labelText: labelText,
        hintStyle: const TextStyle(color: AppPalette.whiteColor),
        labelStyle: const TextStyle(color: AppPalette.whiteColor),
        hintText: hintText,
        errorBorder: buildCustomBorder(AppPalette.errorColor),
        border: buildCustomBorder(AppPalette.whiteColor),
        enabledBorder: buildCustomBorder(AppPalette.whiteColor),
        disabledBorder: buildCustomBorder(AppPalette.whiteColor),
        focusedBorder: buildCustomBorder(AppPalette.whiteColor),
      ),
    );
  }


}
  OutlineInputBorder buildCustomBorder(Color borderColor) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: borderColor),
      borderRadius: const BorderRadius.all(Radius.circular(25.0)),
    );
  }