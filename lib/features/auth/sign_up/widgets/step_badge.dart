import 'package:flutter/material.dart';

import '../../../../shared/theme/app_colors.dart';

class StepBadge extends StatelessWidget {
  const StepBadge({
    super.key,
    required this.label,
    this.backgroundColor = const Color(0xFFE89149),
    this.textColor = Colors.white,
  });

  const StepBadge.pink({super.key, required this.label})
      : backgroundColor = const Color(0xFFFCE4E6),
        textColor = AppColors.primaryRed;

  final String label;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
      ),
    );
  }
}
