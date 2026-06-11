import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../shared/widgets/dashed_box.dart';

class UploadSlot extends StatelessWidget {
  const UploadSlot({
    super.key,
    this.imageAsset,
    required this.onAdd,
    required this.onRemove,
  });

  final String? imageAsset;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: imageAsset == null ? _buildEmpty() : _buildFilled(),
    );
  }

  Widget _buildEmpty() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onAdd,
      child: DashedBox(
        color: const Color(0xFFE89090),
        backgroundColor: const Color(0xFFFEF5F5),
        borderRadius: 14,
        dashLength: 5,
        gapLength: 4,
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                LucideIcons.camera,
                size: 22,
                color: Color(0xFFB5B5B5),
              ),
              SizedBox(height: 6),
              Text(
                'Tambah',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFB5B5B5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilled() {
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              imageAsset!,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(
                color: const Color(0xFFEFB07A),
                alignment: Alignment.center,
                child: const Icon(
                  LucideIcons.image,
                  color: Color(0xFFCC8B5B),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 6,
          right: 6,
          child: GestureDetector(
            onTap: onRemove,
            child: Container(
              width: 22,
              height: 22,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF1F1F1F),
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.close,
                size: 14,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
