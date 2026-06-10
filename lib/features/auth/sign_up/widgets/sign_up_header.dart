import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../shared/theme/app_colors.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({
    super.key,
    this.leadingIcon = LucideIcons.x,
    this.title,
  });

  final IconData leadingIcon;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Container(
      color: AppColors.primaryRed,
      padding: EdgeInsets.only(top: topPadding),
      child: SizedBox(
        height: 56,
        child: Row(
          children: [
            const SizedBox(width: 8),
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(leadingIcon, color: Colors.white, size: 22),
            ),
            Expanded(
              child: Center(
                child: title != null
                    ? Text(
                        title!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      )
                    : Image.asset('assets/images/logo.png', height: 28),
              ),
            ),
            const SizedBox(width: 48),
          ],
        ),
      ),
    );
  }
}
