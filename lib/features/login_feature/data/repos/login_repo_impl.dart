import 'package:dartz/dartz.dart';
import 'package:fix/core/error/failure.dart';
import 'package:fix/features/login_feature/data/data_source/login_data_source.dart';
import 'package:fix/features/login_feature/domain/entities/login_entity.dart';
import 'package:fix/features/login_feature/domain/repo/login_base_repo.dart';
import 'package:fix/features/login_feature/domain/use_cases/login_use_case.dart';

class LoginRepoImpl extends LoginBaseRepo{
  LoginRepoImpl(this.baseDataSource);

  BaseDataSource baseDataSource;

  @override
  Future<Either<ServerFailure, LoginEntity>> loginInApp(LoginParameters parameters) async{
      var result = await baseDataSource.logInApp(parameters);

      try{

       return  right(result);
      }catch (error){
        return  left(result as ServerFailure);
      }

  }


}

