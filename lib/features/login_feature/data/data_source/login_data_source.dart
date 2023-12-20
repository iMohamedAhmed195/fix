import 'package:fix/core/error/error_message_model.dart';
import 'package:fix/core/error/server_exception.dart';
import 'package:fix/core/network/api_constance.dart';
import 'package:fix/core/services/dio_helper.dart';
import 'package:fix/core/services/services_locator.dart';
import 'package:fix/features/login_feature/data/login_model/login_model.dart';
import 'package:fix/features/login_feature/domain/use_cases/login_use_case.dart';

abstract class BaseDataSource{
   Future<LoginModel> logInApp(LoginParameters parameters);

}
class DataSourceImpl extends BaseDataSource{
  @override
  Future<LoginModel> logInApp(LoginParameters parameters)async {
     var result = await  sl<DioHelper>().postData(url: ApiConstants.logIn, data:
         {
           'email' : parameters.email,
           'password' :parameters.password,
         });

        if (result.statusCode == 200) {
           return LoginModel.fromJson(result.data);
     } else if (result.statusCode == 404) {
       try {
         ErrorMessageModel errorMessage = ErrorMessageModel.fromJson(result.data);
         throw errorMessage;
       } catch (e) {
         throw const ServerException(errorMessageModel: ErrorMessageModel(
           statusMessage: 'Error parsing error message',
         ));
       }
     } else {
       ServerException serverException = ServerException(errorMessageModel: ErrorMessageModel.fromJson(result.data));
       throw serverException;
     }
  }

}