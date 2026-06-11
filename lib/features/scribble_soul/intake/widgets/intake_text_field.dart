import 'package:flutter/material.dart';

import '../../../../shared/theme/app_colors.dart';

class IntakeTextField extends StatelessWidget {
  const IntakeTextField({
    super.key,
    this.controller,
    this.hintText,
    this.suffixText,
    this.keyboardType,
    this.maxLines = 1,
    this.minLines,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? suffixText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;

  @override
  Widget build(BuildContext context) {
    final isMultiline = (maxLines ?? 1) > 1 || (minLines ?? 0) > 1;
    return TextField(
      controller: controller,
      keyboardType: isMultiline ? TextInputType.multiline : keyboardType,
      maxLines: maxLines,
      minLines: minLines,
      style: const TextStyle(
        fontSize: 14,
        color: AppColors.darkText,
        height: 1.45,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Color(0xFFB5B5B5),
          height: 1.45,
        ),
        suffixText: suffixText,
        suffixStyle: const TextStyle(
          fontSize: 14,
          color: Color(0xFFB5B5B5),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: isMultiline ? 16 : 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(isMultiline ? 16 : 12),
          borderSide: const BorderSide(color: Color(0xFFE5E5E5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(isMultiline ? 16 : 12),
          borderSide: const BorderSide(
            color: AppColors.primaryRed,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
