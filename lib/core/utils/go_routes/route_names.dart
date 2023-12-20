import 'package:fix/feature/login_feature/presentation/view/login_view.dart';
import 'package:go_router/go_router.dart';



abstract class AppRouter {
  static const kOnBoarding = '/kOnBoarding';
  static const kLogin = '/Login';
  static const kRegister = '/Register';
  static const kHome = '/Home';
  static const kBookDetails = '/BookDetails';

  static final router = GoRouter(
    routes: [
      //GoRoute(
      //  path: '/',
      //  builder: (context, state) =>   const LoginView(),
      //),
      // GoRoute(
      //   path: kOnBoarding,
      //   builder: (context, state) =>   const OnBoardingScreen(),
      // ),
      // GoRoute(
      //   path: kLogin,
      //   builder: (context, state) =>   const LoginView(),
      // ),
      // GoRoute(
      //   path: '/',
      //   builder: (context, state) =>   const RegisterView(),
      // ),

    ],
  );
}
