import 'package:fix/core/services/cache_helper.dart';
import 'package:fix/core/services/dio_helper.dart';
import 'package:fix/core/services/services_locator.dart';
import 'package:fix/core/utils/go_routes/route_names.dart';
import 'package:fix/core/utils/themes.dart';
import 'package:fix/feature/layout/cubit/cubit_layout.dart';
import 'package:fix/feature/layout/cubit/states_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/services/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  sl<DioHelper>().init();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  bool isDark = CacheHelper.getData(key: 'isDark') ?? false;
  bool isOpen = CacheHelper.getData(key: 'isOpen') ?? false;
  bool isArabic1 = CacheHelper.getData(key: 'isArabic') ?? true;


  runApp( MyApp(isDark: isDark, isOpen: isOpen, isArabic1: isArabic1,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isDark, required this.isOpen, required this.isArabic1});
  final bool isDark;
  final bool isOpen;
  final bool isArabic1;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (BuildContext context)  =>San3aLayoutCubit()..changeLang(fromSharedLang: isArabic1)
            ..changeMode(fromShared: isDark, fromShared1: isOpen),
          child: BlocConsumer<San3aLayoutCubit, San3aLayoutStates>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              final cubit = San3aLayoutCubit.get(context);
              return MaterialApp.router(
                routerConfig: AppRouter.router,
                debugShowCheckedModeBanner: false,
                theme: AppThemes.light,
                darkTheme: AppThemes.dark,
                themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
              );
            },
          ),
        );
      },
    );
  }
}

