import 'package:dartz/dartz.dart';
import 'package:fix/core/error/failure.dart';
import 'package:fix/feature/register_feature/domain/entity/register.dart';
import 'package:fix/feature/register_feature/domain/use_case/register_use_case.dart';

abstract class BaseRegisterRepo {
  Future<Either<Failure, RegisterEntity>> fetchRegister(
      RegisterParameters parameters);
}
