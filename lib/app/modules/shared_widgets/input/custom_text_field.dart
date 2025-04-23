import 'package:admin_dashboard/app/cores/themes/app_style.dart';
import 'package:admin_dashboard/app/cores/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 

Widget CustomTextField({
  FormFieldValidator<String>? validator,
  TextEditingController? controller,
  String? initialValue,
  TextInputType? inputType,
  Color? borderColor,
  Color? fillColor,
  Color textColor = AppColors.black1D1D23,
  double textFontSize = 14,
  FontWeight textFontWeight = FontWeight.normal,
  double borderRadius = 10,
  String? hintText,
  Color? hintColor = AppColors.greyEBEFF5,
  Function(String)? onValueChange,
  Function(String)? onSubmit,
  Function()? onTap,
  Widget? suffixIcon,
  Widget? prefixIcon,
  bool isReadOnly = false,
  int maxLine = 1,
  int minLine = 1,
  TextAlignVertical verticalAlignment = TextAlignVertical.top,
  FocusNode? focusNode,
  bool autofocus = false,
  double verticalContendPadding = 0,
  int? maxLength,
  ScrollPhysics scrollPhysics = const NeverScrollableScrollPhysics(),
  bool obscureText = false,
  Color? enabledBorderColor,
  String? labelText,
  TextStyle? labelStyle,
  Color? cursorColor,
  TextStyle? suffixStyle,
}) {
  borderColor ??= AppColors.grey16202E;
  final borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius),
    borderSide: BorderSide(
      color: borderColor,
    ),
  );

  enabledBorderColor ??= borderColor; // Default to borderColor if not provided

  final enabledBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius),
    borderSide: BorderSide(
      color: enabledBorderColor,
    ),
  );

  fillColor ??= AppColors.white;

  List<TextInputFormatter>? inputFormatters;
  if (inputType == TextInputType.number) {
    inputFormatters = <TextInputFormatter>[
      FilteringTextInputFormatter.digitsOnly,
    ];
  }
  return SizedBox(
    height: maxLine > 1 ? null : AppStyle.SPACING_16,
    child: TextFormField(
      autofocus: autofocus,
      focusNode: focusNode,
      controller: controller,
      readOnly: isReadOnly,
      initialValue: initialValue,
      scrollPhysics: scrollPhysics,
      onChanged: (value) {
        if (onValueChange != null) onValueChange(value);
      },
      textAlignVertical: verticalAlignment,
      onTap: onTap,
      cursorColor: cursorColor,
      maxLines: maxLine,
      minLines: minLine,
      maxLength: maxLength,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        labelText: labelText,
        prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
        labelStyle: labelStyle, // Use the provided labelStyle
        counterText: '',
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppStyle.SPACING_16,
          vertical: verticalContendPadding,
        ),
        enabledBorder:
            enabledBorderStyle, // Use the modified enabledBorderStyle
        focusedBorder: borderStyle,
        fillColor: fillColor,
        hintText: hintText,
        filled: true,
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(color: hintColor),
        suffixStyle: suffixStyle,
      ),
      validator: validator,
      keyboardType: inputType,
      onFieldSubmitted: onSubmit,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: textFontSize,
        fontWeight: textFontWeight,
        color: textColor,
      ),
      inputFormatters: inputFormatters,
    ),
  );
}
