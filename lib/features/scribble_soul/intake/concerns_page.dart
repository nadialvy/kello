import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/widgets/primary_button.dart';
import 'widgets/info_note.dart';
import 'widgets/intake_text_field.dart';
import 'widgets/step_progress.dart';

class ConcernsPage extends StatefulWidget {
  const ConcernsPage({super.key});

  @override
  State<ConcernsPage> createState() => _ConcernsPageState();
}

class _ConcernsPageState extends State<ConcernsPage> {
  final TextEditingController _worryController = TextEditingController();
  final TextEditingController _hopeController = TextEditingController();

  @override
  void dispose() {
    _worryController.dispose();
    _hopeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(LucideIcons.arrowLeft, color: AppColors.darkText),
        ),
        title: const Text(
          'Data Si Kecil',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.darkText,
          ),
        ),
        centerTitle: false,
        titleSpacing: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                children: [
                  const StepProgress(
                    label: 'Kekhawatiranmu',
                    currentStep: 4,
                    totalSteps: 4,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Apa yang ingin kamu pahami?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: AppColors.darkText,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Ceritakan detail yang ingin dikonsultasikan agar psikolog kami dapat memberikan panduan terbaik.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF7C7C7C),
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 22),
                  const _FieldLabel('Kekhawatiran'),
                  const SizedBox(height: 8),
                  IntakeTextField(
                    controller: _worryController,
                    hintText:
                        'Contoh: Anak saya sering menangis tiba-tiba tanpa alasan yang jelas...',
                    minLines: 4,
                    maxLines: 6,
                  ),
                  const SizedBox(height: 18),
                  const _FieldLabel('Harapan'),
                  const SizedBox(height: 8),
                  IntakeTextField(
                    controller: _hopeController,
                    hintText:
                        'Contoh: Saya ingin tahu cara merespon emosi anak dengan lebih tenang...',
                    minLines: 4,
                    maxLines: 6,
                  ),
                  const SizedBox(height: 22),
                  const InfoNote(
                    icon: LucideIcons.lock,
                    title: 'Kerahasiaan Terjamin',
                    text:
                        'Data yang kamu bagikan bersifat rahasia dan hanya akan diakses oleh psikolog yang menangani konsultasimu.',
                    backgroundColor: Color(0xFFE7F4E0),
                    iconColor: Color(0xFF4F9132),
                    titleColor: Color(0xFF2F5E1A),
                  ),
                  const SizedBox(height: 18),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: AspectRatio(
                      aspectRatio: 716 / 403,
                      child: Image.asset(
                        'assets/images/scribble-soul/step-4.png',
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) => Container(
                          color: const Color(0xFFE89149),
                          alignment: Alignment.center,
                          child: const Icon(
                            LucideIcons.image,
                            color: Color(0xFFCC8B5B),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              child: PrimaryButton(
                label: 'Lanjut',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);
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
