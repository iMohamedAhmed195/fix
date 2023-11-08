import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fix/core/error/failure.dart';
import 'package:fix/core/use_case/base_usecase.dart';
import 'package:fix/features/login_feature/domain/entities/login_entity.dart';
import 'package:fix/features/login_feature/domain/repo/login_base_repo.dart';

class LoginUseCase extends BaseUseCase<LoginEntity , LoginParameters>{
   LoginBaseRepo loginBaseRepo;

   LoginUseCase(this.loginBaseRepo);

  @override
  Future<Either<Failure, LoginEntity>> call(LoginParameters parameters) async{
 return await  loginBaseRepo.loginInApp(parameters);

  }
}

class LoginParameters extends Equatable{
  final String email;
  final String password ;

 const LoginParameters(this.email, this.password);

  @override
  List<Object?> get props =>[
    email,
    password
  ];
}