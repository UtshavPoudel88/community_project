import 'package:hive/hive.dart';

import '../../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<UserModel?> getUserByEmail(String email);
  Future<void> saveUser(UserModel user);
  Future<UserModel?> getCurrentUser();
  Future<void> setCurrentUser(UserModel? user);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Box<UserModel> userBox;
  final Box<String> sessionBox;

  AuthLocalDataSourceImpl(this.userBox, this.sessionBox);

  @override
  Future<UserModel?> getUserByEmail(String email) async {
    try {
      return userBox.values.firstWhere((user) => user.email == email);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> saveUser(UserModel user) async {
    await userBox.put(user.id, user);
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    final userId = sessionBox.get('current_user');
    if (userId == null) return null;
    return userBox.get(userId);
  }

  @override
  Future<void> setCurrentUser(UserModel? user) async {
    if (user == null) {
      await sessionBox.delete('current_user');
    } else {
      await sessionBox.put('current_user', user.id);
    }
  }
}
