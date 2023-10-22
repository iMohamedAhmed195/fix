import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable{
  final bool status ;
  final bool isPaid ;
  final String name ;
  final String photo ;
  final String role ;
  final String token ;


  const LoginEntity(
      this.status, this.isPaid, this.name, this.photo, this.role, this.token);

  @override
  List<Object?> get props => [
    status,
    isPaid,
    name,
    photo,
    role,
    token
  ];

}