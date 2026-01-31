import 'package:flutter_test/flutter_test.dart';
import 'package:community/features/auth/presentation/utils/login_validators.dart';

void main() {
  group('Login Validators unit', () {
    test('email returns error for empty', () {
      expect(LoginValidators.email(''), isNotNull);
    });
    test('password returns error for short', () {
      expect(LoginValidators.password('123'), isNotNull);
    });
  });
}
