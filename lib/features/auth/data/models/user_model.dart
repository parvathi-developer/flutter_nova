import 'package:flutter_nova/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({required super.id, required super.email});

  factory UserModel.fromFirebase({required String id, required String email}) {
    return UserModel(id: id, email: email);
  }
}
