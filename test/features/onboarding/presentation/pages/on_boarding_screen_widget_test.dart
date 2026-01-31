import 'package:flutter_test/flutter_test.dart';
import 'package:community/features/onboarding/presentation/pages/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('OnBoardingScreen shows first page', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MaterialApp(home: OnBoardingScreen())));
    expect(find.text('Join Your Communities'), findsOneWidget);
  });
}

