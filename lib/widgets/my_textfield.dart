import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dinjan_task/const/color_const.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? hint;
  final bool? isPass;
  final bool? enabled;
  final bool? isPassVisible;
  final Widget? suffix;
  final Widget? prefix;
  final double borderRadius;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validatorFunction;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final double? borderWidth;
  final int? maxLines;
  final int? maxLength;
  final Color? borderColor;
  final bool readOnly;

  const MyTextField(
      {super.key,
      this.controller,
      this.readOnly = false,
      this.prefix,
      this.borderColor,
      this.hint,
      this.textInputType,
      this.isPass = false,
      this.isPassVisible = false,
      this.enabled,
      this.suffix,
      this.borderRadius = 10,
      this.textInputAction,
      this.onChanged,
      this.style,
      this.maxLength,
      this.hintStyle,
      this.contentPadding,
      this.validatorFunction,
      this.borderWidth,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
          color: borderColor ?? ColorConst.c707070, width: borderWidth ?? 1),
    );
    return TextFormField(
      textInputAction: textInputAction,
      maxLength: maxLength,
      keyboardType: textInputType,
      enabled: enabled,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      onChanged: onChanged,
      controller: controller,
      obscureText: isPass ?? false,
      style: style,
      maxLines: maxLines ?? 1,
      minLines: 1,
      readOnly: readOnly,
      validator: validatorFunction,
      decoration: InputDecoration(
        contentPadding:
            contentPadding ?? EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        enabledBorder: border,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide:
              BorderSide(color: ColorConst.primary, width: borderWidth ?? 1.5),
        ),
        disabledBorder: border,
        prefixIcon: prefix,
        prefixIconConstraints: BoxConstraints(
          minHeight: 20.h,
          maxHeight: 20.h,
        ),
        suffixIconConstraints: BoxConstraints(
          minHeight: 20.h,
          maxHeight: 20.h,
        ),
        suffixIcon: suffix,
        border: border,
        hintText: hint,
        focusedErrorBorder: border,
        hintStyle: hintStyle ??
            TextStyle(
              color: Color(0xff344054),
              fontSize: 16.sp,
              fontFamily: 'DMSans36pt',
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
