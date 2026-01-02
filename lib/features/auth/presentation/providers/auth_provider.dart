import 'package:flutter/material.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';

class AuthProvider extends ChangeNotifier {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;

  UserEntity? _user;
  String? _error;
  bool _loading = false;

  AuthProvider({required this.loginUseCase, required this.signUpUseCase});

  UserEntity? get user => _user;
  String? get error => _error;
  bool get loading => _loading;

  Future<bool> login(String email, String password) async {
    _loading = true;
    _error = null;
    notifyListeners();
    final result = await loginUseCase(email, password);
    if (result != null) {
      _user = result;
      _loading = false;
      notifyListeners();
      return true;
    } else {
      _error = 'Invalid credentials';
      _loading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> signUp(String name, String email, String password) async {
    _loading = true;
    _error = null;
    notifyListeners();
    final result = await signUpUseCase(name, email, password);
    if (result != null) {
      _user = result;
      _loading = false;
      notifyListeners();
      return true;
    } else {
      _error = 'User already exists';
      _loading = false;
      notifyListeners();
      return false;
    }
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}
