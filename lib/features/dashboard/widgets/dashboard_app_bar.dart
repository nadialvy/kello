import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../shared/theme/app_colors.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Container(
      color: AppColors.primaryRed,
      padding: EdgeInsets.only(top: topPadding),
      child: SizedBox(
        height: 64,
        child: Row(
          children: [
            const SizedBox(width: 8),
            IconButton(
              onPressed: () {},
              icon: const Icon(LucideIcons.menu, color: Colors.white, size: 24),
            ),
            Expanded(
              child: Center(
                child: Image.asset('assets/images/logo.png', height: 28),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/dashboard/user_avatar.png',
                    width: 36,
                    height: 36,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => const Icon(
                      LucideIcons.user,
                      size: 18,
                      color: AppColors.primaryRed,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
