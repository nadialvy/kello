import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/widgets/primary_button.dart';
import 'behavior_context_page.dart';
import 'widgets/choice_pill.dart';
import 'widgets/info_note.dart';
import 'widgets/intake_text_field.dart';
import 'widgets/radio_option_tile.dart';
import 'widgets/step_progress.dart';

class ChildIdentityPage extends StatefulWidget {
  const ChildIdentityPage({super.key, required this.initialName});

  final String initialName;

  @override
  State<ChildIdentityPage> createState() => _ChildIdentityPageState();
}

class _ChildIdentityPageState extends State<ChildIdentityPage> {
  late final TextEditingController _nameController;
  final TextEditingController _ageController =
      TextEditingController(text: '7');

  String _gender = 'Laki-laki';
  String _birthOrder = 'Sulung';
  String _familyCondition = 'Orang tua lengkap';

  static const _genderOptions = ['Laki-laki', 'Perempuan'];
  static const _birthOrderOptions = [
    'Sulung',
    'Tengah',
    'Bungsu',
    'Anak Tunggal',
  ];
  static const _familyConditionOptions = [
    'Orang tua lengkap',
    'Single parent',
  ];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
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
                    label: 'Identitas Anak',
                    currentStep: 1,
                    totalSteps: 4,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Perkenalkan si kecil kepada psikolog kami',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: AppColors.darkText,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Data ini membantu kami mencocokkan psikolog terbaik untuk perkembangan si kecil.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF7C7C7C),
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 22),
                  const _FieldLabel('Nama Lengkap'),
                  const SizedBox(height: 8),
                  IntakeTextField(controller: _nameController),
                  const SizedBox(height: 18),
                  const _FieldLabel('Usia Anak'),
                  const SizedBox(height: 8),
                  IntakeTextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    suffixText: 'tahun',
                  ),
                  const SizedBox(height: 18),
                  const _FieldLabel('Jenis Kelamin'),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      for (var i = 0; i < _genderOptions.length; i++) ...[
                        if (i > 0) const SizedBox(width: 10),
                        Expanded(
                          child: ChoicePill(
                            label: _genderOptions[i],
                            selected: _gender == _genderOptions[i],
                            onTap: () =>
                                setState(() => _gender = _genderOptions[i]),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 18),
                  const _FieldLabel('Urutan Anak'),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      for (final option in _birthOrderOptions)
                        ChoicePill(
                          label: option,
                          selected: _birthOrder == option,
                          onTap: () =>
                              setState(() => _birthOrder = option),
                        ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  const _FieldLabel('Kondisi Keluarga'),
                  const SizedBox(height: 8),
                  for (var i = 0;
                      i < _familyConditionOptions.length;
                      i++) ...[
                    if (i > 0) const SizedBox(height: 10),
                    RadioOptionTile(
                      label: _familyConditionOptions[i],
                      selected:
                          _familyCondition == _familyConditionOptions[i],
                      onTap: () => setState(
                        () => _familyCondition =
                            _familyConditionOptions[i],
                      ),
                    ),
                  ],
                  const SizedBox(height: 22),
                  const InfoNote(
                    icon: LucideIcons.lock,
                    text:
                        'Data ini bersifat rahasia dan hanya akan diakses oleh psikolog yang menangani konsultasi si kecil.',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              child: PrimaryButton(
                label: 'Lanjut',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const BehaviorContextPage(),
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
