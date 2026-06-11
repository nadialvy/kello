import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../shared/theme/app_colors.dart';
import '../../../shared/widgets/primary_button.dart';
import 'concerns_page.dart';
import 'widgets/icon_choice_pill.dart';
import 'widgets/step_progress.dart';
import 'widgets/upload_slot.dart';

class ArtworkUploadPage extends StatefulWidget {
  const ArtworkUploadPage({super.key});

  @override
  State<ArtworkUploadPage> createState() => _ArtworkUploadPageState();
}

class _ArtworkUploadPageState extends State<ArtworkUploadPage> {
  List<String?> _uploads = const [
    'assets/images/scribble-soul/sample_artwork.png',
    null,
    null,
  ];

  String _drawingContext = 'Digambar sendiri';
  String _mood = 'Senang';
  String _material = 'Krayon';

  static const _contextOptions = ['Digambar sendiri', 'Dibantu orang tua'];
  static const _moodOptions = <_MoodOption>[
    _MoodOption('Senang', LucideIcons.smile),
    _MoodOption('Biasa saja', LucideIcons.meh),
    _MoodOption('Sedih', LucideIcons.frown),
  ];
  static const _materialOptions = <_MaterialOption>[
    _MaterialOption('Krayon', LucideIcons.brush),
    _MaterialOption('Pensil Warna', LucideIcons.pencil),
    _MaterialOption('Cat Air', LucideIcons.droplet),
    _MaterialOption('Spidol', LucideIcons.pen),
  ];

  void _addUpload(int index) {
    setState(() {
      _uploads = [
        for (var i = 0; i < _uploads.length; i++)
          if (i == index)
            'assets/images/scribble-soul/sample_artwork.png'
          else
            _uploads[i],
      ];
    });
  }

  void _removeUpload(int index) {
    setState(() {
      _uploads = [
        for (var i = 0; i < _uploads.length; i++)
          if (i == index) null else _uploads[i],
      ];
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
                    label: 'Karya Seni',
                    currentStep: 3,
                    totalSteps: 4,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Upload karya terbaru si kecil',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: AppColors.darkText,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Bantu kami memahami perkembangan ekspresi visualnya.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF7C7C7C),
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      for (var i = 0; i < _uploads.length; i++) ...[
                        if (i > 0) const SizedBox(width: 10),
                        Expanded(
                          child: UploadSlot(
                            imageAsset: _uploads[i],
                            onAdd: () => _addUpload(i),
                            onRemove: () => _removeUpload(i),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 22),
                  const _FieldLabel('Konteks Pembuatan'),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      for (final option in _contextOptions)
                        IconChoicePill(
                          label: option,
                          selected: _drawingContext == option,
                          leadingIcon: _drawingContext == option
                              ? LucideIcons.circleCheck
                              : null,
                          onTap: () =>
                              setState(() => _drawingContext = option),
                        ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  const _FieldLabel('Suasana hati si kecil'),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      for (final option in _moodOptions)
                        IconChoicePill(
                          label: option.label,
                          leadingIcon: option.icon,
                          selected: _mood == option.label,
                          onTap: () =>
                              setState(() => _mood = option.label),
                        ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  const _FieldLabel('Bahan yang digunakan'),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      for (final option in _materialOptions)
                        IconChoicePill(
                          label: option.label,
                          leadingIcon: option.icon,
                          selected: _material == option.label,
                          onTap: () =>
                              setState(() => _material = option.label),
                        ),
                    ],
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
                      builder: (_) => const ConcernsPage(),
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

class _MoodOption {
  const _MoodOption(this.label, this.icon);
  final String label;
  final IconData icon;
}

class _MaterialOption {
  const _MaterialOption(this.label, this.icon);
  final String label;
  final IconData icon;
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
