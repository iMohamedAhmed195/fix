import 'package:fix/features/login_feature/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  final String message;
  final UserData? userData;

  const LoginModel({
    required status,
    required token,
    required this.message,
    required this.userData,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
      message: json['message'],
      userData: json['data'] != null ? UserData.fromJson(json['data']) : null,
      status: json['status'],
      token: json['token']);
}

class UserData extends LoginEntity {
  const UserData({
    isPaid,
    name,
    photo,
    role,
  });
  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
      name: json['name'],
      photo: json['photo'],
      isPaid: json['isPaid'],
      role: json['role']);
}
