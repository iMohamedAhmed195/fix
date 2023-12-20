import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:fix/core/error/failure.dart';
import 'package:fix/core/use_case/base_usecase.dart';
import 'package:fix/feature/register_feature/domain/entity/register.dart';
import 'package:fix/feature/register_feature/domain/repo/base_register_repo.dart';
import 'package:flutter/cupertino.dart';

class RegisterUseCase extends BaseUseCase<RegisterEntity, RegisterParameters> {
  BaseRegisterRepo baseRegisterRepo;
  RegisterUseCase(this.baseRegisterRepo);
  @override
  Future<Either<Failure, RegisterEntity>> call(
      RegisterParameters parameters) async {
    return await baseRegisterRepo.fetchRegister(parameters);
  }
}

class RegisterParameters extends Equatable {
  final String name;
  final String password;
  final String confirmPassword;
  final String phone;
  final String email;
  final String role;
  final String birthDate;
  final String city;
  final String nationalId;
  final File photo;
  final File idPhoto;
  final String address;
  final String? jobTitle;
  const RegisterParameters(
      {required this.email,
      required this.jobTitle,
      required this.role,
      required this.birthDate,
      required this.city,
      required this.nationalId,
      required this.photo,
      required this.idPhoto,
      required this.address,
      required this.name,
      required this.password,
      required this.confirmPassword,
      required this.phone});

  @override
  List<Object?> get props => [
        jobTitle,
        email,
        role,
        birthDate,
        city,
        nationalId,
        photo,
        idPhoto,
        address,
        name,
        password,
        confirmPassword,
        phone
      ];
}
