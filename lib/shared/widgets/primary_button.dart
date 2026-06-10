import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.labelStyle,
  });

  final String label;
  final VoidCallback onPressed;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = const TextStyle(
      fontFamily: 'PlusJakartaSans',
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ).merge(labelStyle);
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryRed,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: Text(label, style: effectiveStyle),
      ),
    );
  }
}
