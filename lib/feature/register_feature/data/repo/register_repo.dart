import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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
    FormData formattedData = FormData.fromMap({
      "photo": await MultipartFile.fromFile(parameters.photo.path,
          filename: parameters.photo.path.split("/").last),
      'name': parameters.name,
      'email': parameters.email,
      'password': parameters.password,
      'passwordConfirm': parameters.confirmPassword,
      'phone': parameters.phone,
      'birthdate': parameters.birthDate,
      'city': parameters.city,
      'national_id': parameters.nationalId,
      'role': parameters.role,
      'job': parameters.jobTitle,
      'photo_id': await MultipartFile.fromFile(parameters.idPhoto.path,
          filename: parameters.idPhoto.path.split("/").last),
    });

    final result = await baseRegisterRemoteDataSource.fetchRegister(formattedData);

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
