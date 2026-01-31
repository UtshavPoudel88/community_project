import 'package:flutter_test/flutter_test.dart';
import 'package:community/features/explore/presentation/pages/explore_screen.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('ExploreScreen renders', (tester) async {
    await tester.pumpWidget(MaterialApp(home: ExploreScreen(onJoin: (map) {})));
    expect(find.byType(ExploreScreen), findsOneWidget);
  });
}
