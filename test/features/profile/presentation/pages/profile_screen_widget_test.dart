import 'package:flutter_test/flutter_test.dart';
import 'package:community/features/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('ProfileScreen renders', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ProfileScreen()));
    expect(find.byType(ProfileScreen), findsOneWidget);
  });
}
