import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iot_test_app/core/config/app_palette.dart';

class CustomTextFormField extends StatefulWidget {
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
  final bool enableObscureToggle;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.onTap,
    this.enabled = true,
    this.contextMenuBuilder,
    this.prefixIcon,
    this.suffixIcon,
    this.textColor,
    this.obscureText = false,
    this.enableObscureToggle = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      contextMenuBuilder: widget.contextMenuBuilder,
      enabled: widget.enabled,
      onTap: widget.onTap,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: _obscure,
      cursorColor: AppPalette.blackColor,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
        color: widget.textColor ?? AppPalette.blackColor,
      ),
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.enableObscureToggle
            ? IconButton(
                icon: Icon(
                  _obscure ? Icons.visibility_off : Icons.visibility,
                  color: AppPalette.blackColor,
                ),
                onPressed: () {
                  setState(() {
                    _obscure = !_obscure;
                  });
                },
              )
            : widget.suffixIcon,
        labelText: widget.labelText,
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: AppPalette.blackColor),
        labelStyle: const TextStyle(color: AppPalette.blackColor),
        errorStyle: Theme.of(
          context,
        ).textTheme.titleSmall?.copyWith(color: AppPalette.errorColor),
        border: _buildCustomBorder(AppPalette.blackColor),
        enabledBorder: _buildCustomBorder(AppPalette.blackColor),
        disabledBorder: _buildCustomBorder(AppPalette.blackColor),
        focusedBorder: _buildCustomBorder(AppPalette.blackColor),
        errorBorder: _buildCustomBorder(AppPalette.errorColor),
      ),
    );
  }
}

OutlineInputBorder _buildCustomBorder(Color borderColor) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: borderColor),
    borderRadius: const BorderRadius.all(Radius.circular(25.0)),
  );
}
