import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yuk_run/main.dart';

void main() {
  testWidgets('YukRun app should render splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(const YukRunApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
