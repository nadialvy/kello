import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../shared/theme/app_colors.dart';
import '../../shared/widgets/outline_button.dart';
import '../../shared/widgets/primary_button.dart';
import '../auth/login_page.dart';
import 'widgets/feature_card.dart';
import 'widgets/onboarding_cta.dart';
import 'widgets/onboarding_top_bar.dart';
import 'widgets/testimonial_card.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

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
              const SizedBox(height:12),
              OnboardingTopBar(onMasukTap: () => _goToLogin(context)),
              const SizedBox(height: 12),
              const Text(
                'Pahami emosi si kecil\nlewat seninya',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primaryBlue,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Kello membantu orang tua menerjemahkan coretan dan gambar anak menjadi wawasan emosional yang mendalam.',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.mutedText,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              PrimaryButton(
                label: 'Daftar Sekarang',
                labelStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
                onPressed: () => _goToLogin(context),
              ),
              const SizedBox(height: 10),
              OutlineButton(
                label: 'Masuk',
                labelStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
                onPressed: () => _goToLogin(context),
              ),
              const SizedBox(height: 40),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/onboarding.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 48),
              const FeatureCard(
                icon: LucideIcons.brush,
                iconColor: AppColors.primaryRed,
                background: Color(0xFFFDECEC),
                title: 'Scribble Soul',
                description:
                    'Analisis coretan pertama si kecil untuk memahami perkembangan motorik dan emosi awalnya.',
              ),
              const SizedBox(height: 12),
              const FeatureCard(
                icon: LucideIcons.lightbulb,
                iconColor: Color(0xFFE89B3C),
                background: Color(0xFFFFF9EC),
                title: 'Pahami Emosi',
                description:
                    'Dapatkan laporan mendalam tentang kondisi psikologis anak berdasarkan pilihan warna dan bentuk.',
              ),
              const SizedBox(height: 12),
              const FeatureCard(
                icon: LucideIcons.shoppingBag,
                iconColor: Color(0xFFB58B5B),
                background: Color(0xFFF0FAF5),
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
                  color: AppColors.darkText,
                ),
              ),
              const SizedBox(height: 16),
              const TestimonialCard(
                name: 'Mama Maria',
                quote:
                    '"Kello membantu saya mengerti kenapa anak saya tiba-tiba sering memakai warna hitam. Ternyata dia sedang merasa cemas."',
                avatarColor: Color(0xFFFFC1C1),
              ),
              const SizedBox(height: 12),
              const TestimonialCard(
                name: 'Papa Budi',
                quote:
                    '"Sangat informatif! Fitur Shop Your Art juga keren banget, kaos dengan gambar anak saya jadi kado ulang tahun favorit kakeknya."',
                avatarColor: Color(0xFFFFE0A6),
              ),
              const SizedBox(height: 28),
              OnboardingCta(onTap: () => _goToLogin(context)),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
