import 'package:fix/features/login_feature/domain/entities/login_entity.dart';
import 'package:fix/features/login_feature/domain/use_cases/login_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());

  final LoginUseCase loginUseCase;
   LoginEntity? loginEntity;
  var emailController= TextEditingController();
  var passwordController= TextEditingController();
  var formKey = GlobalKey<FormState>();

  Future<void>  logInApp() async{
    emit(LoginLoadingState());
   var result = await loginUseCase.call(LoginParameters(emailController.text, passwordController.text));

   result.fold(
           (error){
             print(error.errorMessage);
             emit(LoginErrorState());
           },
           (loginEntity) {
             this.loginEntity=loginEntity;
             emit(LoginSuccessState());
           },
   );
  }

}
