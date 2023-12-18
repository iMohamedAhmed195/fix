import 'package:dartz/dartz.dart';
import 'package:fix/core/error/failure.dart';
import 'package:fix/core/error/server_exception.dart';
import 'package:fix/feature/register_feature/data/data_source/register_remote_data_source.dart';
import 'package:fix/feature/register_feature/domain/entity/register.dart';
import 'package:fix/feature/register_feature/domain/repo/base_register_repo.dart';
import 'package:fix/feature/register_feature/domain/use_case/register_use_case.dart';

class RegisterRepo extends BaseRegisterRepo {
  BaseRegisterRemoteDataSource baseRegisterRemoteDataSource;
  RegisterRepo(this.baseRegisterRemoteDataSource);
  @override
  Future<Either<Failure, RegisterEntity>> fetchRegister(
      RegisterParameters parameters) async {
    final result = await baseRegisterRemoteDataSource.fetchRegister(parameters);

    try {
      return Right(result);
    } catch (failure) {
      if (failure is ServerException) {
        return Left(ServerFailure(failure.errorMessageModel.statusMessage));
      } else {
        return const Left(ServerFailure('there is an error we dont now that'));
      }
    }
  }
}
