import 'package:community/main.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../data/models/user_model.dart';
import '../../data/datasources/local/auth_local_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';
import '../providers/auth_provider.dart';

class AuthViewModel {
  static Future<AuthProvider> create() async {
    try {
      if (!Hive.isAdapterRegistered(0)) {
        Hive.registerAdapter(UserModelAdapter());
      }
      final userBox = await Hive.openBox<UserModel>('users');
      final sessionBox = await Hive.openBox<String>('session');
      final localDataSource = AuthLocalDataSourceImpl(userBox, sessionBox);
      final repository = AuthRepositoryImpl(localDataSource);
      final loginUseCase = LoginUseCase(repository);
      final signUpUseCase = SignUpUseCase(repository);
      return AuthProvider(loginUseCase: loginUseCase, signUpUseCase: signUpUseCase);
    } catch (e, st) {
      // Optionally log error
      debugPrint('Hive AuthViewModel error: $e\n$st');
      rethrow;
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const MyApp());
}
