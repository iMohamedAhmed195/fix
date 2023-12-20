import 'package:dartz/dartz.dart';
import 'package:fix/core/error/failure.dart';
import 'package:fix/core/error/server_exception.dart';
import 'package:fix/feature/login_feature/data/data_source/login_data_source.dart';
import 'package:fix/feature/login_feature/data/login_model/login_model.dart';
import 'package:fix/feature/login_feature/domain/repo/login_base_repo.dart';
import 'package:fix/feature/login_feature/domain/use_cases/login_use_case.dart';


class LoginRepoImpl extends LoginBaseRepo{
  LoginRepoImpl(this.baseDataSource);

  BaseDataSource baseDataSource;

  @override
  Future<Either<Failure, LoginModel>> loginInApp(LoginParameters parameters) async{


      try{
        final result = await baseDataSource.logInApp(parameters);
       return  Right(result);
      }catch (failure){
        if (failure is ServerException) {
          return Left(ServerFailure(failure.errorMessageModel.statusMessage));
        } else {
          return  Left(ServerFailure('there is an error we dont now that'));
        }
      }

  }


}

