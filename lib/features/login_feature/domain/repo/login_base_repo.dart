import 'package:dartz/dartz.dart';
import 'package:fix/core/error/failure.dart';
import 'package:fix/features/login_feature/domain/entities/login_entity.dart';
import 'package:fix/features/login_feature/domain/use_cases/login_use_case.dart';

abstract class  LoginBaseRepo {
  Future<Either<Failure , LoginEntity>> loginInApp(LoginParameters parameters);
}