import 'package:fix/feature/register_feature/domain/entity/register.dart';

class RegisterModel extends RegisterEntity {
  const RegisterModel(
      {required super.status, required super.message, required super.statusCode});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
      status: json["status"],
      message: json["message"],
      statusCode: json["notError"]["statusCode"]);
}
