import 'package:flutter/material.dart';

import '../../../shared/theme/app_colors.dart';

class OnboardingTopBar extends StatelessWidget {
  const OnboardingTopBar({super.key, required this.onMasukTap});

  final VoidCallback onMasukTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 24),
        Image.asset(
          'assets/images/logo.png',
          height: 72,
        ),
        GestureDetector(
          onTap: onMasukTap,
          child: const Text(
            'Masuk',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryRed,
            ),
          ),
        ),
      ],
    );
  }
}
