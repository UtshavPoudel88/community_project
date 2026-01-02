import '../../domain/entities/user_entity.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String email;
  @HiveField(3)
  String password;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  factory UserModel.fromEntity(UserEntity entity) => UserModel(
        id: entity.id,
        name: entity.name,
        email: entity.email,
        password: entity.password,
      );

  UserEntity toEntity() => UserEntity(
        id: id,
        name: name,
        email: email,
        password: password,
      );
}