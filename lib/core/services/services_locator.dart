import 'package:dio/dio.dart';
import 'package:fix/core/services/dio_helper.dart';
import 'package:fix/feature/presentation/controller/register_cubit.dart';
import 'package:get_it/get_it.dart';


final sl = GetIt.instance ;

class ServiceLocator {

  void init(){
    sl.registerLazySingleton(() => LoginCubit(sl()));
    sl.registerLazySingleton<LoginBaseRepo>(() => LoginRepoImpl(sl()));
    sl.registerLazySingleton<BaseDataSource>(() => DataSourceImpl());
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => DioHelper());

    ///Data Source
    sl.registerLazySingleton<BaseRegisterRemoteDataSource>(
            () => RegisterRemoteDataSource());

    ///REPO
    sl.registerLazySingleton<BaseRegisterRepo>(() => RegisterRepo(sl()));

    ///UseCase
    sl.registerLazySingleton(() => RegisterUseCase(sl()));

    ///bloc
    sl.registerLazySingleton(() => RegisterCubit(sl()));
  }
}