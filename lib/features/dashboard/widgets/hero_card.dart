import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/widgets/primary_button.dart';

class HeroCard extends StatelessWidget {
  const HeroCard({super.key, required this.onStart});

  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF5F1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE89149), width: 1.2),
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            right: -24,
            bottom: -28,
            child: Icon(
              LucideIcons.brush,
              size: 160,
              color: const Color(0xFFE89149).withValues(alpha: 0.18),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFFFBD4A8),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'Baru!',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkText,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Mulai perjalananmu!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: AppColors.darkText,
                ),
              ),
              const SizedBox(height: 6),
              const SizedBox(
                width: 220,
                child: Text(
                  'Temukan keajaiban melalui seni dan terapi yang menyenangkan.',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF6B6B6B),
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              IntrinsicWidth(
                child: PrimaryButton(
                  label: 'Mulai Sekarang',
                  trailingIcon: LucideIcons.arrowRight,
                  labelStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                  onPressed: onStart,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
