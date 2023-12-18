import 'package:fix/core/error/error_message_model.dart';
import 'package:fix/core/error/server_exception.dart';
import 'package:fix/core/network/api_constance.dart';
import 'package:fix/core/services/dio_helper.dart';
import 'package:fix/core/services/services_locator.dart';
import 'package:fix/feature/register_feature/data/model/register_model.dart';
import 'package:fix/feature/register_feature/domain/use_case/register_use_case.dart';

abstract class BaseRegisterRemoteDataSource {
  Future<RegisterModel> fetchRegister(RegisterParameters parameters);
}

class RegisterRemoteDataSource extends BaseRegisterRemoteDataSource {
  @override
  Future<RegisterModel> fetchRegister(RegisterParameters parameters) async {
    print("sdnsakdjnkjnkas");

    final response =
        await sl<DioHelper>().postData(url: ApiConstants.register, data: {
      "name": parameters.name,
      "password": parameters.password,
      "passwordConfirm": parameters.confirmPassword,
      "phone": parameters.phone,
      "email": parameters.email,
      "role": parameters.role,
      "birthdate": parameters.birthDate,
      "city": parameters.city,
      "national_id": parameters.nationalId,
      "photo": parameters.photo,
      "photo_id": parameters.idPhoto,
      "addresse": parameters.address,
    });
    print("sdnsakd---------------------jnkjnkas");

    print(response);
    print(response.data);
    print(response.statusMessage);
    print(response.statusCode);



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
