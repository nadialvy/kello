import 'package:flutter/material.dart';

import '../../../../shared/theme/app_colors.dart';

class IconChoicePill extends StatelessWidget {
  const IconChoicePill({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.leadingIcon,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final IconData? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: 44,
        padding: EdgeInsets.symmetric(
          horizontal: leadingIcon != null ? 14 : 20,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryRed : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: selected
                ? AppColors.primaryRed
                : const Color(0xFFE5E5E5),
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leadingIcon != null) ...[
              Icon(
                leadingIcon,
                size: 16,
                color:
                    selected ? Colors.white : const Color(0xFF8E8E8E),
              ),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: selected ? Colors.white : AppColors.darkText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
