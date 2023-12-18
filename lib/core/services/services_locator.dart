import 'package:fix/core/services/dio_helper.dart';
import 'package:fix/feature/register_feature/data/data_source/register_remote_data_source.dart';
import 'package:fix/feature/register_feature/data/repo/register_repo.dart';
import 'package:fix/feature/register_feature/domain/repo/base_register_repo.dart';
import 'package:fix/feature/register_feature/domain/use_case/register_use_case.dart';
import 'package:fix/feature/register_feature/presentation/controller/register_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
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
