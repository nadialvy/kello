import 'package:flutter/material.dart';

import '../../../../shared/theme/app_colors.dart';

class StepProgress extends StatelessWidget {
  const StepProgress({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  final int currentStep;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalSteps * 2 - 1, (i) {
        if (i.isOdd) return const SizedBox(width: 6);
        final index = i ~/ 2;
        final isActive = index < currentStep;
        return Expanded(
          child: Container(
            height: 5,
            decoration: BoxDecoration(
              color:
                  isActive ? AppColors.primaryRed : const Color(0xFFE8E8E8),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        );
      }),
    );
  }
}
