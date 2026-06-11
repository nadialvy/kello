import 'package:flutter/material.dart';

import '../../../../shared/theme/app_colors.dart';

class StepProgress extends StatelessWidget {
  const StepProgress({
    super.key,
    required this.label,
    required this.currentStep,
    required this.totalSteps,
  });

  final String label;
  final int currentStep;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFF39A4F),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            Text(
              'Langkah $currentStep dari $totalSteps',
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF7C7C7C),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            for (var i = 0; i < totalSteps; i++) ...[
              if (i > 0) const SizedBox(width: 6),
              Expanded(
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: i < currentStep
                        ? AppColors.primaryRed
                        : const Color(0xFFEDEDED),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
