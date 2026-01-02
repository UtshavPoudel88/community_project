import 'package:hive/hive.dart';
import '../models/user_model.dart';

void registerUserSchema() {
  Hive.registerAdapter(UserModelAdapter());
}
