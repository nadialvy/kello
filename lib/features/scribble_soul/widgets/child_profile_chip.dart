import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../shared/theme/app_colors.dart';

class ChildProfileChip extends StatelessWidget {
  const ChildProfileChip({
    super.key,
    required this.name,
    required this.imageAsset,
    required this.selected,
    required this.onTap,
  });

  final String name;
  final String imageAsset;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final borderColor =
        selected ? AppColors.primaryRed : const Color(0xFFE5E5E5);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: 104,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: borderColor,
            width: selected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected
                      ? AppColors.primaryRed
                      : const Color(0xFFEDEDED),
                  width: 2,
                ),
              ),
              child: ClipOval(
                child: Image.asset(
                  imageAsset,
                  width: 52,
                  height: 52,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => Container(
                    color: const Color(0xFFF3F3F3),
                    alignment: Alignment.center,
                    child: const Icon(
                      LucideIcons.user,
                      size: 24,
                      color: Color(0xFF9A9A9A),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
                color: selected
                    ? AppColors.primaryRed
                    : AppColors.darkText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddChildProfileChip extends StatelessWidget {
  const AddChildProfileChip({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: 104,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE5E5E5)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF3F3F3),
              ),
              alignment: Alignment.center,
              child: const Icon(
                LucideIcons.plus,
                size: 26,
                color: Color(0xFF9A9A9A),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Tambah Profil',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6B6B6B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
