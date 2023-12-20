part of 'login_cubit.dart';


abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoadingState extends LoginState {}
class LoginSuccessState extends LoginState {
  final LoginEntity loginEntity;

  LoginSuccessState(this.loginEntity);
}
class LoginErrorState extends LoginState {}
