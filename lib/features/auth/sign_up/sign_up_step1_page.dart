import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../shared/widgets/primary_button.dart';
import 'sign_up_step2_page.dart';
import 'widgets/sign_up_header.dart';
import 'widgets/step_badge.dart';
import 'widgets/step_progress.dart';

class SignUpStep1Page extends StatelessWidget {
  const SignUpStep1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SignUpHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const StepBadge(label: 'Langkah 1 dari 4'),
                  const SizedBox(height: 14),
                  const Text(
                    'Data Diri',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColors.darkText,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Lengkapi informasi berikut untuk memulai perjalanan terapi si kecil.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF7C7C7C),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const StepProgress(currentStep: 1, totalSteps: 4),
                  const SizedBox(height: 28),
                  const _Label('Nama Lengkap'),
                  const SizedBox(height: 8),
                  const AppTextField(hintText: 'Contoh: Budi Santoso'),
                  const SizedBox(height: 20),
                  const _Label('Nomor HP'),
                  const SizedBox(height: 8),
                  const _PhoneField(),
                  const SizedBox(height: 20),
                  const _Label('Email'),
                  const SizedBox(height: 8),
                  const AppTextField(
                    hintText: 'nama@email.com',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  const _InfoCard(
                    text:
                        'Informasi ini akan kami gunakan untuk menghubungi Anda terkait jadwal terapi dan aktivitas si kecil.',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
            child: PrimaryButton(
              label: 'Lanjut',
              trailingIcon: LucideIcons.arrowRight,
              labelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              onPressed: () {
                FocusScope.of(context).unfocus();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const SignUpStep2Page(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.darkText,
      ),
    );
  }
}

class _PhoneField extends StatelessWidget {
  const _PhoneField();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFF1C5C9)),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(color: Color(0xFFF1C5C9)),
              ),
            ),
            child: const Text(
              '+62',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.darkText,
              ),
            ),
          ),
          const Expanded(
            child: TextField(
              keyboardType: TextInputType.phone,
              style: TextStyle(fontSize: 14, color: AppColors.darkText),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '812 3456 7890',
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Color(0xFFB5B5B5),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(LucideIcons.info, size: 18, color: AppColors.primaryRed),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF6B6B6B),
                height: 1.45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
