import 'package:flutter/material.dart';

import 'features/onboarding/onboarding_screen.dart';

void main() {
  runApp(const KelloApp());
}

class KelloApp extends StatelessWidget {
  const KelloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kello',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'PlusJakartaSans',
      ),
      home: const OnboardingScreen(),
    );
  }
}
