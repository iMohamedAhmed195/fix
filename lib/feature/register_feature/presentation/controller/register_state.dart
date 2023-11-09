part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class ChangePhoneState extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterSuccess extends RegisterState {

}

class RegisterError extends RegisterState {

}
class ProfileImageSuccessStates extends RegisterState {}
class ProfileImageErrorStates extends RegisterState {}

class UserTypeOptionState extends RegisterState {}
class ChangeOptionState extends RegisterState {}
class AgreementStateDone extends RegisterState {}
