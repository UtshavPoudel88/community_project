import 'package:flutter_test/flutter_test.dart';
import 'package:community/features/auth/presentation/utils/signup_validators.dart';

void main() {
  group('Signup Validators unit', () {
    test('email returns error for empty', () {
      expect(SignupValidators.email(''), isNotNull);
    });
    test('password returns error for short', () {
      expect(SignupValidators.password('123'), isNotNull);
    });
  });
}
