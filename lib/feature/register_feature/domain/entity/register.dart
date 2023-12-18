import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final bool status;
  final String message;
  final int statusCode;

  const RegisterEntity(
      {required this.status, required this.message, required this.statusCode});
  @override
  List<Object?> get props => [status, message, statusCode];
}

