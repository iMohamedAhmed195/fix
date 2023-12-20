import 'package:equatable/equatable.dart';
import 'package:fix/core/utils/enums/user_type.dart';

class LoginEntity extends Equatable {
  final bool status;
  final bool isPaid;
  final String name;
  final String photo;
  final UserType role;
  final String token;

  const LoginEntity(
      {required this.status,required  this.isPaid,required  this.name,required  this.photo,required  this.role,required  this.token});

  @override
  List<Object?> get props => [status, isPaid, name, photo, role, token];
}
