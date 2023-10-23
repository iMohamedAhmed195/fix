import 'package:dio/dio.dart';
import 'package:fix/core/services/dio_helper.dart';
import 'package:get_it/get_it.dart';


final sl = GetIt.instance ;

class ServiceLocator {

  void init(){
    sl.registerLazySingleton(() =>DioHelper(sl()));
    sl.registerLazySingleton(() => Dio());


  }
}