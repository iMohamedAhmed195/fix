import 'package:dio/dio.dart';
import 'package:fix/core/error/error_message_model.dart';
import 'package:fix/core/error/server_exception.dart';
import 'package:fix/core/network/api_constance.dart';
import 'package:fix/feature/register_feature/data/model/register_model.dart';

abstract class BaseRegisterRemoteDataSource {
  Future<RegisterModel> fetchRegister(FormData formattedData);
}

class RegisterRemoteDataSource extends BaseRegisterRemoteDataSource {
  @override
  Future<RegisterModel> fetchRegister(FormData formattedData) async {
    final response = await Dio().post(
      '${ApiConstants.baseUrl}${ApiConstants.register}',
      data: formattedData,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'multipart/form-data'
        },
      ),
    );

    if (response.statusCode == 200) {
      return RegisterModel.fromJson(response.data);
    } else if (response.statusCode == 404) {
      try {
        ErrorMessageModel errorMessage =
            ErrorMessageModel.fromJson(response.data);
        throw errorMessage;
      } catch (e) {
        throw const ServerException(
            errorMessageModel: ErrorMessageModel(
          statusMessage: 'Error parsing error message',
        ));
      }
    } else {
      ServerException serverException = ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
      throw serverException;
    }
  }
}
