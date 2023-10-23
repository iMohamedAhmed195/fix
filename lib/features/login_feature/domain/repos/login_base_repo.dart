import 'package:dartz/dartz.dart';
import 'package:fix/core/error/failure.dart';
import 'package:fix/features/login_feature/data/models/login_model.dart';

abstract class LoginBaseRepo {
 Future<Either<ServerFailure , LoginModel>> loginInApp({required String email,required String password});
}