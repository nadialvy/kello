import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../shared/theme/app_colors.dart';
import 'activity_card.dart';
import 'hero_card.dart';
import 'psychologist_card.dart';
import 'quick_action_tile.dart';
import 'section_header.dart';

class _ForYouItem {
  const _ForYouItem({
    required this.imageAsset,
    required this.imagePlaceholderColor,
    required this.category,
    required this.categoryColor,
    required this.title,
    required this.description,
  });

  final String imageAsset;
  final Color imagePlaceholderColor;
  final String category;
  final Color categoryColor;
  final String title;
  final String description;
}

const List<_ForYouItem> _forYouItems = [
  _ForYouItem(
    imageAsset: 'assets/images/dashboard/activity_warna_emosi.png',
    imagePlaceholderColor: Color(0xFF2A3142),
    category: 'Aktivitas',
    categoryColor: AppColors.primaryRed,
    title: 'Mengenal Warna Emosi',
    description: 'Ekspresikan perasaanmu lewat…',
  ),
  _ForYouItem(
    imageAsset: 'assets/images/dashboard/activity_meditasi.png',
    imagePlaceholderColor: Color(0xFFEDE7DA),
    category: 'Meditasi',
    categoryColor: Color(0xFFB58B5B),
    title: 'Tarik Napas',
    description: 'Relaksasi sejenak…',
  ),
  _ForYouItem(
    imageAsset: 'assets/images/dashboard/activity_journaling.png',
    imagePlaceholderColor: Color(0xFFE7EEFB),
    category: 'Journaling',
    categoryColor: Color(0xFF4A8AF4),
    title: 'Tulis Cerita Hari Ini',
    description: 'Ceritakan momen spesialmu…',
  ),
  _ForYouItem(
    imageAsset: 'assets/images/dashboard/activity_musik.png',
    imagePlaceholderColor: Color(0xFFFCE4E6),
    category: 'Musik',
    categoryColor: Color(0xFFB42230),
    title: 'Dengarkan Lagu Tenang',
    description: 'Pilih playlist favoritmu…',
  ),
];

class BerandaView extends StatelessWidget {
  const BerandaView({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: 'Hei, $userName! ',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: AppColors.darkText,
              ),
              children: const [
                TextSpan(text: '👋', style: TextStyle(fontSize: 22)),
              ],
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Siap untuk petualangan kreatif hari ini?',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF7C7C7C),
            ),
          ),
          const SizedBox(height: 18),
          HeroCard(onStart: () {}),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: QuickActionTile(
                  label: 'Scribble Soul',
                  icon: LucideIcons.brush,
                  iconColor: const Color(0xFFE89149),
                  iconBackground: const Color(0xFFFCE8D6),
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: QuickActionTile(
                  label: 'Shop Your Art',
                  icon: LucideIcons.shoppingBag,
                  iconColor: const Color(0xFF4A8AF4),
                  iconBackground: const Color(0xFFE7EEFB),
                  onTap: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          SectionHeader(
            title: 'For You Today',
            actionLabel: 'Lihat Semua',
            onActionTap: () {},
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 250,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemCount: _forYouItems.length,
              separatorBuilder: (_, _) => const SizedBox(width: 12),
              itemBuilder: (_, i) {
                final item = _forYouItems[i];
                return ActivityCard(
                  imageAsset: item.imageAsset,
                  imagePlaceholderColor: item.imagePlaceholderColor,
                  category: item.category,
                  categoryColor: item.categoryColor,
                  title: item.title,
                  description: item.description,
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          SectionHeader(
            title: 'Rekomendasi Psikolog',
            actionLabel: 'Cari Lainnya',
            onActionTap: () {},
          ),
          const SizedBox(height: 14),
          const PsychologistCard(
            name: 'Dr. Sari Permata',
            specialty: 'Spesialis Tumbuh Kembang',
            imageAsset: 'assets/images/dashboard/psychologist_sari.png',
            placeholderColor: Color(0xFFE89149),
            rating: 4.9,
            tags: [
              PsychologistTag(
                'Art Therapy',
                Color(0xFFFCE8D6),
                Color(0xFFA45924),
              ),
              PsychologistTag(
                'Anxiety',
                Color(0xFFFADAB7),
                Color(0xFF8C5A1B),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const PsychologistCard(
            name: 'Bapak Andi Wijaya',
            specialty: 'Psikolog Klinis Anak',
            imageAsset: 'assets/images/dashboard/psychologist_andi.png',
            placeholderColor: Color(0xFF4A8AF4),
            rating: 4.8,
            tags: [
              PsychologistTag(
                'Behavior',
                Color(0xFFFCE4E6),
                Color(0xFFB42230),
              ),
              PsychologistTag(
                'Parenting',
                Color(0xFFFADAB7),
                Color(0xFF8C5A1B),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
