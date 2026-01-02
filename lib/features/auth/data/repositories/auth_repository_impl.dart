import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/local/auth_local_datasource.dart';
import '../models/user_model.dart';
import 'package:uuid/uuid.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;
  AuthRepositoryImpl(this.localDataSource);

  @override
  Future<UserEntity?> login(String email, String password) async {
    final user = await localDataSource.getUserByEmail(email);
    if (user != null && user.password == password) {
      await localDataSource.setCurrentUser(user);
      return user.toEntity();
    }
    return null;
  }

  @override
  Future<UserEntity?> signUp(String name, String email, String password) async {
    final existing = await localDataSource.getUserByEmail(email);
    if (existing != null) return null;
    final user = UserModel(
      id: const Uuid().v4(),
      name: name,
      email: email,
      password: password,
    );
    await localDataSource.saveUser(user);
    await localDataSource.setCurrentUser(user);
    return user.toEntity();
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    final user = await localDataSource.getCurrentUser();
    return user?.toEntity();
  }

  @override
  Future<void> logout() async {
    await localDataSource.setCurrentUser(null);
  }
}
