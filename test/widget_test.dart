import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:kello/main.dart';

void main() {
  testWidgets('App boots and shows splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(const KelloApp());

    expect(find.byType(FlutterLogo), findsOneWidget);
  });
}
