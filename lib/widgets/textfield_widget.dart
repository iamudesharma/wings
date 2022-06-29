import 'package:flutter/material.dart';

TextFormField textFormField(
  TextEditingController controller, {
  required String hintText,
  required IconData icon,
  required String label,
  bool isPassword = false,
  VoidCallback? onTap,
  TextInputAction? textInputAction,
  bool readonly = false,
  TextInputType? textInputType,
  required String? Function(String?)? validator,
  void Function(String)? onChanged,
  int? maxLines = 1,
}) {
  return TextFormField(
    maxLines: maxLines,
    onChanged: onChanged,
    onTap: onTap,
    readOnly: readonly,
    validator: validator,
    keyboardType: textInputType ?? TextInputType.text,
    enabled: true,
    textInputAction: textInputAction,
    controller: controller,
    obscureText: isPassword,
    decoration: InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      prefixIcon: Icon(
        icon,
      ),
      hintText: hintText,
    ),
  );
}
