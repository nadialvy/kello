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
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
      decoration: BoxDecoration(
        color: const Color(0xFFFCEDD9),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE89149), width: 1.2),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -10,
            bottom: -10,
            top: -10,
            child: Image.asset(
              'assets/images/dashboard/hero_decoration.png',
              width: 130,
              fit: BoxFit.contain,
              errorBuilder: (_, _, _) => const SizedBox.shrink(),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFFE89149),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'Baru!',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
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
