import 'package:flutter/material.dart';

import '../../../../shared/theme/app_colors.dart';

class InfoNote extends StatelessWidget {
  const InfoNote({
    super.key,
    required this.icon,
    required this.text,
    this.title,
    this.backgroundColor,
    this.iconColor,
    this.titleColor,
  });

  final IconData icon;
  final String text;
  final String? title;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: iconColor ?? AppColors.mutedText),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null) ...[
                  Text(
                    title!,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: titleColor ?? AppColors.darkText,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 12,
                    height: 1.45,
                    color: Color(0xFF6B6B6B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
