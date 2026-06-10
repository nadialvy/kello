import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'login_page.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const Color _primaryRed = Color(0xFFD02130);
  static const Color _darkText = Color(0xFF1F1F1F);
  static const Color _mutedText = Color(0xFF5C403E);
  static const Color _primaryBlue= Color(0xFF085E9D);

  void _goToLogin(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              _TopBar(onMasukTap: () => _goToLogin(context)),
              const Text(
                'Pahami emosi si kecil\nlewat seninya',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: _primaryBlue,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Kello membantu orang tua menerjemahkan coretan dan gambar anak menjadi wawasan emosional yang mendalam.',
                style: TextStyle(
                  fontSize: 16,
                  color: _mutedText,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
                _PrimaryButton(
                  label: 'Daftar Sekarang',
                  labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
                  onPressed: () => _goToLogin(context),
                ),
                const SizedBox(height: 10),
              _OutlineButton(
                label: 'Masuk',
                labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
                onPressed: () => _goToLogin(context),
              ),
              const SizedBox(height: 24),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/onboarding.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 28),
              const _FeatureCard(
                icon: LucideIcons.brush,
                iconColor: _primaryRed,
                background: Color(0xFFFDECEC),
                title: 'Scribble Soul',
                description:
                    'Analisis coretan pertama si kecil untuk memahami perkembangan motorik dan emosi awalnya.',
              ),
              const SizedBox(height: 12),
              const _FeatureCard(
                icon: LucideIcons.lightbulb,
                iconColor: Color(0xFFE89B3C),
                background: Color(0xFFFFF1E2),
                title: 'Pahami Emosi',
                description:
                    'Dapatkan laporan mendalam tentang kondisi psikologis anak berdasarkan pilihan warna dan bentuk.',
              ),
              const SizedBox(height: 12),
              const _FeatureCard(
                icon: LucideIcons.shoppingBag,
                iconColor: Color(0xFFB58B5B),
                background: Color(0xFFF6EEDF),
                title: 'Shop Your Art',
                description:
                    'Ubah karya seni anak menjadi merchandise eksklusif seperti kaos, mug, atau kanvas premium.',
              ),
              const SizedBox(height: 32),
              const Text(
                'Apa Kata Orang Tua',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: _darkText,
                ),
              ),
              const SizedBox(height: 16),
              const _TestimonialCard(
                name: 'Mama Maria',
                quote:
                    '"Kello membantu saya mengerti kenapa anak saya tiba-tiba sering memakai warna hitam. Ternyata dia sedang merasa cemas."',
                avatarColor: Color(0xFFFFC1C1),
              ),
              const SizedBox(height: 12),
              const _TestimonialCard(
                name: 'Papa Budi',
                quote:
                    '"Sangat informatif! Fitur Shop Your Art juga keren banget, kaos dengan gambar anak saya jadi kado ulang tahun favorit kakeknya."',
                avatarColor: Color(0xFFFFE0A6),
              ),
              const SizedBox(height: 28),
              _BottomCta(onTap: () => _goToLogin(context)),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.onMasukTap});

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
              color: OnboardingScreen._primaryRed,
            ),
          ),
        ),
      ],
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({
    required this.label,
    required this.onPressed,
    this.labelStyle,
  });

  final String label;
  final VoidCallback onPressed;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = const TextStyle(
      fontFamily: 'PlusJakartaSans',
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ).merge(labelStyle);
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: OnboardingScreen._primaryRed,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: Text(label, style: effectiveStyle),
      ),
    );
  }
}

class _OutlineButton extends StatelessWidget {
  const _OutlineButton({
    required this.label,
    required this.onPressed,
    this.labelStyle,
  });

  final String label;
  final VoidCallback onPressed;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = const TextStyle(
      fontFamily: 'PlusJakartaSans',
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ).merge(labelStyle);
    return SizedBox(
      height: 48,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: OnboardingScreen._primaryRed,
          side: const BorderSide(color: OnboardingScreen._primaryRed),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: Text(label, style: effectiveStyle),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.icon,
    required this.iconColor,
    required this.background,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final Color iconColor;
  final Color background;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: OnboardingScreen._darkText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: OnboardingScreen._mutedText,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  const _TestimonialCard({
    required this.name,
    required this.quote,
    required this.avatarColor,
  });

  final String name;
  final String quote;
  final Color avatarColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: avatarColor,
                child: const Icon(
                  LucideIcons.user,
                  size: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: OnboardingScreen._darkText,
                    ),
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (_) => const Icon(
                        LucideIcons.star,
                        size: 12,
                        color: Color(0xFFF5A623),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            quote,
            style: const TextStyle(
              fontSize: 13,
              color: OnboardingScreen._mutedText,
              height: 1.5,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomCta extends StatelessWidget {
  const _BottomCta({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: OnboardingScreen._primaryRed,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Text(
            'Mulai Perjalanan Anda\nBersama Si Kecil',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Daftar sekarang dan dapatkan analisis pertama secara gratis!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Colors.white,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: OnboardingScreen._primaryRed,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              child: const Text(
                'Daftar Gratis',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
