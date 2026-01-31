import 'package:community/core/services/storage/user_session_service.dart';
import 'package:community/features/dashboard/presentation/pages/home_screen.dart';
import 'package:community/features/explore/presentation/pages/explore_screen.dart';
import 'package:community/features/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';



/// ✅ Fake user session service for tests
class FakeUserSessionService implements UserSessionService {
  @override
  String? getCurrentUserFullName() => 'Test User';

  @override
  String? getCurrentUserEmail() => 'test@gmail.com';

  @override
  String? getCurrentUserProfilePicture() => '';

  @override
  Future<void> clearSession() async {}

  @override
  String? getCurrentUserId() => '1';

  @override
  String? getCurrentUserPhoneNumber() => '';

  @override
  bool isLoggedIn() => true;

  @override
  Future<void> saveUserSession({required String userId, required String email, required String fullName, String? phoneNumber, String? profilePicture}) async {}

  @override
  Future<void> updateUserProfilePicture(String pictureFileName) async {}

  @override
  Future<String?> getToken() async => null;

  @override
  Future<void> saveToken(String token) async {}
}

void main() {
  testWidgets('DashboardScreen switches bottom navigation screens', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          userSessionServiceProvider.overrideWithValue(FakeUserSessionService()),
        ],
        child: const MaterialApp(
          home: HomeScreen(),
        ),
      ),
    );

    // Default screen should be HomeScreen
    expect(find.byType(HomeScreen), findsOneWidget);

    // Tap Explore (Communities tab, uses Icons.groups)
    await tester.tap(find.byIcon(Icons.groups));
    await tester.pumpAndSettle();
    expect(find.byType(ExploreScreen), findsOneWidget);

    // Tap Profile (uses Icons.person)
    await tester.tap(find.byIcon(Icons.person));
    await tester.pumpAndSettle();
    expect(find.byType(ProfileScreen), findsOneWidget);

    // (User name/email not shown in ProfileScreen, so we skip those checks)
  });
}