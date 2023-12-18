part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class ChangePhoneState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String errorMessage;
  RegisterErrorState({required this.errorMessage});
}

class ProfileImageSuccessStates extends RegisterState {}

class SelectDateErrorState extends RegisterState {}

class SelectDateSuccessState extends RegisterState {}

class SelectDateLoadingState extends RegisterState {}

class ProfileImageErrorStates extends RegisterState {}

class ChangeUserTypeOptionState extends RegisterState {}

class ChangeCraftTypeOptionState extends RegisterState {}

class AgreementStateDone extends RegisterState {}

class ChangePasswordVisibilityState extends RegisterState {}
class ChangeConfirmPasswordVisibilityState extends RegisterState {}


