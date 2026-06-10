import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class OutlineButton extends StatelessWidget {
  const OutlineButton({
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
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryRed,
          side: const BorderSide(color: AppColors.primaryRed),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: Text(label, style: effectiveStyle),
      ),
    );
  }
}
