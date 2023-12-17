import 'package:fix/core/utils/enums.dart';
import 'package:fix/features/login_feature/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel(
      {
        required super.status,
        required  super.isPaid,
        required super.name,
        required  super.photo,
        required  super.role,
        required super.token
      });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      LoginModel(
          status : json['status'],
          isPaid:json['data']['isPaid'],
          name:json['data']['name'],
          photo:json['data']['photo'],
          role:json['data']['role'] == 'customer'  ?  UserType.customer : UserType.worker,
          token:json['token']
      );

}
UserType? parseWidgetType(String userTypeString) {
  for (UserType type in UserType.values) {
    if (type.toString() == 'WidgetType.$userTypeString') {
      return type;
    }
  }
  return null;
}