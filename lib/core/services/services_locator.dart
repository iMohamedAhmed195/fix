import 'package:dio/dio.dart';
import 'package:fix/core/services/dio_helper.dart';

import 'package:fix/features/login_feature/data/data_source/login_data_source.dart';
import 'package:fix/features/login_feature/data/repos/login_repo_impl.dart';
import 'package:fix/features/login_feature/domain/repo/login_base_repo.dart';
import 'package:fix/features/login_feature/domain/use_cases/login_use_case.dart';
import 'package:fix/features/login_feature/presentation/controller/login_cubit.dart';
import 'package:get_it/get_it.dart';


final sl = GetIt.instance ;

class ServiceLocator {

  void init(){
    sl.registerLazySingleton(() =>DioHelper(sl()));
    sl.registerLazySingleton(() => Dio());
    sl.registerLazySingleton(() => LoginCubit(sl()));
    sl.registerLazySingleton<LoginBaseRepo>(() => LoginRepoImpl(sl()));
    sl.registerLazySingleton<BaseDataSource>(() => DataSourceImpl());
    sl.registerLazySingleton(() => LoginUseCase(sl()));



  }
}