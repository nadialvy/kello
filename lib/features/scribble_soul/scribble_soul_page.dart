import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../shared/theme/app_colors.dart';
import '../../shared/widgets/primary_button.dart';
import 'widgets/benefit_row.dart';
import 'widgets/child_profile_chip.dart';

class ScribbleSoulPage extends StatefulWidget {
  const ScribbleSoulPage({super.key});

  @override
  State<ScribbleSoulPage> createState() => _ScribbleSoulPageState();
}

class _ScribbleSoulPageState extends State<ScribbleSoulPage> {
  int _selectedChildIndex = 0;
  static const int _navIndex = 1;

  void _onNavTap(int index) {
    if (index == _navIndex) return;
    Navigator.of(context).pop(index);
  }

  static const _children = <_ChildProfile>[
    _ChildProfile(
      name: 'Budi',
      asset: 'assets/images/scribble-soul/budi.png',
    ),
    _ChildProfile(
      name: 'Nisa',
      asset: 'assets/images/scribble-soul/nisa.png',
    ),
  ];

  static const _navTabs = <_NavTab>[
    _NavTab(label: 'Beranda', icon: LucideIcons.house),
    _NavTab(label: 'Scribble Soul', icon: LucideIcons.brush),
    _NavTab(label: 'Shop Your Art', icon: LucideIcons.shoppingBag),
    _NavTab(label: 'Profil', icon: LucideIcons.user),
  ];

  @override
  Widget build(BuildContext context) {
    final selectedName = _children[_selectedChildIndex].name;
    return Scaffold(
      backgroundColor: AppColors.primaryRed,
      body: Column(
        children: [
          _Header(),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 22, 20, 28),
                children: [
                  const _SectionTitle('Untuk siapa sesi ini?'),
                  const SizedBox(height: 14),
                  SizedBox(
                    height: 132,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _children.length + 1,
                      separatorBuilder: (_, _) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        if (index == _children.length) {
                          return AddChildProfileChip(onTap: () {});
                        }
                        final child = _children[index];
                        return ChildProfileChip(
                          name: child.name,
                          imageAsset: child.asset,
                          selected: index == _selectedChildIndex,
                          onTap: () => setState(
                            () => _selectedChildIndex = index,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  const _SectionTitle('Apa yang kamu dapatkan?'),
                  const SizedBox(height: 16),
                  const BenefitRow(
                    icon: LucideIcons.clock,
                    title: 'Sesi 30–60 menit',
                    description:
                        'Interaksi langsung melalui video call yang santai untuk si kecil.',
                  ),
                  const SizedBox(height: 16),
                  const BenefitRow(
                    icon: LucideIcons.bookOpen,
                    title: 'Analisis karya',
                    description:
                        'Psikolog akan membedah makna di balik coretan dan gambar anak.',
                  ),
                  const SizedBox(height: 16),
                  const BenefitRow(
                    icon: LucideIcons.fileText,
                    title: 'Laporan emosional',
                    description:
                        'Hasil evaluasi mendalam tentang kondisi mental dan saran orang tua.',
                  ),
                  const SizedBox(height: 28),
                  PrimaryButton(
                    label: 'Mulai untuk $selectedName',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _BottomNav(
        tabs: _navTabs,
        currentIndex: _navIndex,
        onTap: _onNavTap,
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Padding(
      padding: EdgeInsets.fromLTRB(8, topPadding + 4, 20, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).maybePop(),
                icon: const Icon(
                  LucideIcons.arrowLeft,
                  color: Colors.white,
                  size: 22,
                ),
              ),
              const SizedBox(width: 2),
              const Text(
                'Scribble Soul',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text(
              'Pahami hati si kecil bersama psikolog kami',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                height: 1.25,
              ),
            ),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: AspectRatio(
                aspectRatio: 16 / 10,
                child: Image.asset(
                  'assets/images/scribble-soul/hero.png',
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => Container(
                    color: const Color(0xFFFEE4E4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.darkText,
      ),
    );
  }
}

class _ChildProfile {
  const _ChildProfile({required this.name, required this.asset});
  final String name;
  final String asset;
}

class _NavTab {
  const _NavTab({required this.label, required this.icon});
  final String label;
  final IconData icon;
}

class _BottomNav extends StatelessWidget {
  const _BottomNav({
    required this.tabs,
    required this.currentIndex,
    required this.onTap,
  });

  final List<_NavTab> tabs;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFEDEDED))),
      ),
      padding: EdgeInsets.fromLTRB(
        4,
        8,
        4,
        8 + MediaQuery.of(context).padding.bottom,
      ),
      child: Row(
        children: [
          for (var i = 0; i < tabs.length; i++)
            Expanded(
              child: _NavItem(
                tab: tabs[i],
                selected: i == currentIndex,
                onTap: () => onTap(i),
              ),
            ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.tab,
    required this.selected,
    required this.onTap,
  });

  final _NavTab tab;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.primaryRed : const Color(0xFF8E8E8E);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(tab.icon, size: 22, color: color),
            const SizedBox(height: 4),
            Text(
              tab.label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
