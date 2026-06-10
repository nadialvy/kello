import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../shared/widgets/primary_button.dart';
import 'sign_up_step3_page.dart';
import 'widgets/sign_up_header.dart';
import 'widgets/step_badge.dart';
import 'widgets/step_progress.dart';

const Color _successGreen = Color(0xFF1FA84B);
const Color _mediumOrange = Color(0xFFE89149);
const Color _weakRed = Color(0xFFE05A4B);
const Color _mutedGray = Color(0xFFB5B5B5);

class SignUpStep2Page extends StatefulWidget {
  const SignUpStep2Page({super.key});

  @override
  State<SignUpStep2Page> createState() => _SignUpStep2PageState();
}

class _SignUpStep2PageState extends State<SignUpStep2Page> {
  final _passwordCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _passwordCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  bool get _hasMinLength => _passwordCtrl.text.length >= 8;
  bool get _hasUpperLower =>
      _passwordCtrl.text.contains(RegExp(r'[a-z]')) &&
      _passwordCtrl.text.contains(RegExp(r'[A-Z]'));
  bool get _hasDigit => _passwordCtrl.text.contains(RegExp(r'\d'));
  bool get _hasSymbol =>
      _passwordCtrl.text.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>_\-+=/\\\[\]~`]'));

  int get _strength {
    var count = 0;
    if (_hasMinLength) count++;
    if (_hasUpperLower) count++;
    if (_hasDigit) count++;
    if (_hasSymbol) count++;
    return count;
  }

  bool get _passwordsMatch =>
      _confirmCtrl.text.isNotEmpty && _confirmCtrl.text == _passwordCtrl.text;

  @override
  Widget build(BuildContext context) {
    final passwordBorder = _passwordCtrl.text.isEmpty
        ? null
        : (_strength == 4 ? _successGreen : null);
    final confirmBorder = _confirmCtrl.text.isEmpty
        ? null
        : (_passwordsMatch ? _successGreen : _weakRed);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SignUpHeader(
            leadingIcon: LucideIcons.arrowLeft,
            title: 'Sign Up',
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: StepProgress(currentStep: 2, totalSteps: 4),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 4, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const StepBadge.pink(label: 'Langkah 2 dari 4'),
                  const SizedBox(height: 14),
                  const Text(
                    'Buat kata sandi yang aman',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppColors.darkText,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Gunakan kombinasi huruf, angka, dan simbol.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF7C7C7C),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const _Label('Kata Sandi Baru'),
                  const SizedBox(height: 8),
                  AppTextField(
                    controller: _passwordCtrl,
                    hintText: '••••••••',
                    obscureText: _obscurePassword,
                    borderColor: passwordBorder,
                    onChanged: (_) => setState(() {}),
                    suffixIcon: GestureDetector(
                      onTap: () => setState(
                        () => _obscurePassword = !_obscurePassword,
                      ),
                      child: Icon(
                        _obscurePassword
                            ? LucideIcons.eye
                            : LucideIcons.eyeOff,
                        size: 20,
                        color: const Color(0xFF7C7C7C),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _StrengthMeter(strength: _strength),
                  const SizedBox(height: 20),
                  _RequirementsCard(
                    items: [
                      _Requirement('Minimal 8 karakter', _hasMinLength),
                      _Requirement(
                          'Gunakan huruf besar & kecil', _hasUpperLower),
                      _Requirement('Gunakan angka', _hasDigit),
                      _Requirement(
                          'Gunakan simbol (mis. @#\$)', _hasSymbol),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const _Label('Konfirmasi Kata Sandi'),
                  const SizedBox(height: 8),
                  AppTextField(
                    controller: _confirmCtrl,
                    hintText: '••••••••',
                    obscureText: true,
                    borderColor: confirmBorder,
                    onChanged: (_) => setState(() {}),
                    suffixIcon: _confirmCtrl.text.isEmpty
                        ? null
                        : Icon(
                            _passwordsMatch
                                ? LucideIcons.check
                                : LucideIcons.x,
                            size: 20,
                            color: _passwordsMatch
                                ? _successGreen
                                : _weakRed,
                          ),
                  ),
                  if (_confirmCtrl.text.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(
                      _passwordsMatch
                          ? 'Kata sandi cocok'
                          : 'Kata sandi tidak cocok',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color:
                            _passwordsMatch ? _successGreen : _weakRed,
                      ),
                    ),
                  ],
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
                    builder: (_) => const SignUpStep3Page(),
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

class _StrengthMeter extends StatelessWidget {
  const _StrengthMeter({required this.strength});

  /// 0 (empty) up to 4 (all requirements met).
  final int strength;

  @override
  Widget build(BuildContext context) {
    if (strength == 0) return const SizedBox.shrink();

    final (filledBars, color, label) = switch (strength) {
      1 => (1, _weakRed, 'Lemah'),
      2 => (2, _mediumOrange, 'Sedang'),
      3 => (3, _mediumOrange, 'Kuat'),
      _ => (3, _successGreen, 'Sangat Kuat'),
    };

    return Row(
      children: [
        for (int i = 0; i < 3; i++) ...[
          if (i > 0) const SizedBox(width: 6),
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: i < filledBars ? color : const Color(0xFFE8E8E8),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
        const Spacer(),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
      ],
    );
  }
}

class _Requirement {
  const _Requirement(this.text, this.met);
  final String text;
  final bool met;
}

class _RequirementsCard extends StatelessWidget {
  const _RequirementsCard({required this.items});

  final List<_Requirement> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFDECEC),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < items.length; i++) ...[
            if (i > 0) const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: items[i].met ? _successGreen : _mutedGray,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    LucideIcons.check,
                    size: 12,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  items[i].text,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.darkText,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
