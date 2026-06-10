import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../../../shared/widgets/dashed_box.dart';
import '../../../shared/widgets/primary_button.dart';
import 'widgets/sign_up_header.dart';
import 'widgets/step_badge.dart';
import 'widgets/step_progress.dart';

const Color _accentOrange = Color(0xFFE89149);
const Color _accentOrangeLight = Color(0xFFFADAB7);

enum _Gender { male, female }

class SignUpStep4Page extends StatefulWidget {
  const SignUpStep4Page({super.key});

  @override
  State<SignUpStep4Page> createState() => _SignUpStep4PageState();
}

class _SignUpStep4PageState extends State<SignUpStep4Page> {
  _Gender _gender = _Gender.male;
  DateTime? _birthDate;

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _birthDate ?? DateTime(now.year - 5, now.month, now.day),
      firstDate: DateTime(now.year - 18),
      lastDate: now,
    );
    if (picked != null) setState(() => _birthDate = picked);
  }

  String get _formattedBirthDate {
    if (_birthDate == null) return 'mm/dd/yyyy';
    final m = _birthDate!.month.toString().padLeft(2, '0');
    final d = _birthDate!.day.toString().padLeft(2, '0');
    return '$m/$d/${_birthDate!.year}';
  }

  @override
  Widget build(BuildContext context) {
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
            child: StepProgress(currentStep: 4, totalSteps: 4),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 4, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const StepBadge.pink(label: 'Langkah 4 dari 4'),
                  const SizedBox(height: 14),
                  const Text(
                    'Sekarang, kenalkan si kecil!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppColors.darkText,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Buat profil untuk setiap anak.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF7C7C7C),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _ChildCard(
                    gender: _gender,
                    onGenderChanged: (g) => setState(() => _gender = g),
                    birthDateText: _formattedBirthDate,
                    onPickDate: _pickDate,
                    hasBirthDate: _birthDate != null,
                  ),
                  const SizedBox(height: 16),
                  _AddChildButton(onTap: () {}),
                  const SizedBox(height: 16),
                  const _SecurityNote(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
            child: PrimaryButton(
              label: 'Selesai & Mulai',
              trailingIcon: LucideIcons.arrowRight,
              labelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              onPressed: () =>
                  Navigator.of(context).popUntil((r) => r.isFirst),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChildCard extends StatelessWidget {
  const _ChildCard({
    required this.gender,
    required this.onGenderChanged,
    required this.birthDateText,
    required this.onPickDate,
    required this.hasBirthDate,
  });

  final _Gender gender;
  final ValueChanged<_Gender> onGenderChanged;
  final String birthDateText;
  final VoidCallback onPickDate;
  final bool hasBirthDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1C5C9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: _PhotoPicker(onTap: () {})),
          const SizedBox(height: 24),
          const _Label('Nama si kecil'),
          const SizedBox(height: 8),
          const AppTextField(hintText: 'Contoh: Kello Junior'),
          const SizedBox(height: 16),
          const _Label('Tanggal lahir'),
          const SizedBox(height: 8),
          _DateField(
            text: birthDateText,
            hasValue: hasBirthDate,
            onTap: onPickDate,
          ),
          const SizedBox(height: 16),
          const _Label('Jenis Kelamin'),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _GenderButton(
                  label: 'Laki-laki',
                  icon: Icons.male,
                  selected: gender == _Gender.male,
                  onTap: () => onGenderChanged(_Gender.male),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _GenderButton(
                  label: 'Perempuan',
                  icon: Icons.female,
                  selected: gender == _Gender.female,
                  onTap: () => onGenderChanged(_Gender.female),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PhotoPicker extends StatelessWidget {
  const _PhotoPicker({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 88,
        height: 88,
        child: DashedBox(
          shape: BoxShape.circle,
          color: AppColors.primaryRed,
          backgroundColor: const Color(0xFFFCEFEF),
          child: const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(LucideIcons.camera, size: 22, color: AppColors.darkText),
                SizedBox(height: 2),
                Text(
                  'Foto',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkText,
                  ),
                ),
              ],
            ),
          ),
        ),
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

class _DateField extends StatelessWidget {
  const _DateField({
    required this.text,
    required this.hasValue,
    required this.onTap,
  });

  final String text;
  final bool hasValue;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFF1C5C9)),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  color: hasValue
                      ? AppColors.darkText
                      : const Color(0xFFB5B5B5),
                ),
              ),
            ),
            const Icon(
              LucideIcons.calendar,
              size: 18,
              color: AppColors.primaryRed,
            ),
          ],
        ),
      ),
    );
  }
}

class _GenderButton extends StatelessWidget {
  const _GenderButton({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: selected ? _accentOrangeLight : Colors.white,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: selected ? _accentOrange : const Color(0xFFF1C5C9),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: selected ? _accentOrange : AppColors.darkText,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: selected ? AppColors.darkText : AppColors.darkText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddChildButton extends StatelessWidget {
  const _AddChildButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 48,
        child: DashedBox(
          borderRadius: 28,
          color: AppColors.primaryRed,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  LucideIcons.circlePlus,
                  size: 18,
                  color: AppColors.primaryRed,
                ),
                SizedBox(width: 8),
                Text(
                  '+ Tambah anak lain',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryRed,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SecurityNote extends StatelessWidget {
  const _SecurityNote();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(LucideIcons.lock, size: 14, color: Color(0xFF7C7C7C)),
        SizedBox(width: 6),
        Text(
          'Informasi Anda aman dan terenkripsi',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF7C7C7C),
          ),
        ),
      ],
    );
  }
}
