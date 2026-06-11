import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/widgets/primary_button.dart';
import 'artwork_upload_page.dart';
import 'widgets/choice_pill.dart';
import 'widgets/info_note.dart';
import 'widgets/intake_text_field.dart';
import 'widgets/multi_choice_chip.dart';
import 'widgets/selectable_tag.dart';
import 'widgets/step_progress.dart';

class BehaviorContextPage extends StatefulWidget {
  const BehaviorContextPage({super.key});

  @override
  State<BehaviorContextPage> createState() => _BehaviorContextPageState();
}

class _BehaviorContextPageState extends State<BehaviorContextPage> {
  final TextEditingController _detailController = TextEditingController();

  String _behaviorChange = 'Ya';
  Set<String> _emotions = {'Marah', 'Berteriak'};
  Set<String> _bigEvents = {'Tidak ada'};

  static const _behaviorOptions = ['Ya', 'Tidak'];
  static const _emotionOptions = [
    'Marah',
    'Berteriak',
    'Menangis',
    'Menyendiri',
    'Agresif',
    'Cemas',
  ];
  static const _bigEventOptions = [
    'Pindah rumah/sekolah',
    'Tidak ada',
  ];

  @override
  void dispose() {
    _detailController.dispose();
    super.dispose();
  }

  void _toggleEmotion(String value) {
    setState(() {
      if (_emotions.contains(value)) {
        _emotions = {..._emotions}..remove(value);
      } else {
        _emotions = {..._emotions, value};
      }
    });
  }

  void _toggleBigEvent(String value) {
    setState(() {
      final isNone = value == 'Tidak ada';
      if (_bigEvents.contains(value)) {
        _bigEvents = {..._bigEvents}..remove(value);
      } else if (isNone) {
        _bigEvents = {value};
      } else {
        _bigEvents = {..._bigEvents, value}..remove('Tidak ada');
      }
    });
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
                    label: 'Konteks Perilaku',
                    currentStep: 2,
                    totalSteps: 4,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Ceritakan keseharian si kecil',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppColors.darkText,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 22),
                  const _FieldLabel('Perubahan perilaku?'),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      for (var i = 0; i < _behaviorOptions.length; i++) ...[
                        if (i > 0) const SizedBox(width: 12),
                        Expanded(
                          child: ChoicePill(
                            label: _behaviorOptions[i],
                            selected:
                                _behaviorChange == _behaviorOptions[i],
                            onTap: () => setState(
                              () => _behaviorChange = _behaviorOptions[i],
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 12),
                  IntakeTextField(
                    controller: _detailController,
                    hintText:
                        'Contoh: Akhir-akhir ini sering terbangun tengah malam...',
                    minLines: 4,
                    maxLines: 6,
                  ),
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      const _FieldLabel('Ekspresi emosi?'),
                      const Spacer(),
                      Text(
                        'Bisa pilih lebih dari satu',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryRed,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      for (final option in _emotionOptions)
                        MultiChoiceChip(
                          label: option,
                          selected: _emotions.contains(option),
                          onTap: () => _toggleEmotion(option),
                        ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  const _FieldLabel('Kejadian besar dalam 6 bulan terakhir?'),
                  const SizedBox(height: 10),
                  for (var i = 0; i < _bigEventOptions.length; i++) ...[
                    if (i > 0) const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SelectableTag(
                        label: _bigEventOptions[i],
                        selected:
                            _bigEvents.contains(_bigEventOptions[i]),
                        onTap: () => _toggleBigEvent(_bigEventOptions[i]),
                      ),
                    ),
                  ],
                  const SizedBox(height: 22),
                  const InfoNote(
                    icon: LucideIcons.lock,
                    text:
                        'Privasi data Anda adalah prioritas kami. Informasi ini hanya akan digunakan untuk menyesuaikan rekomendasi terapi bagi si kecil.',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              child: PrimaryButton(
                label: 'Lanjut',
                trailingIcon: LucideIcons.arrowRight,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ArtworkUploadPage(),
                    ),
                  );
                },
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
