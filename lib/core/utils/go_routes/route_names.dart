import 'package:fix/features/verification_features/forget_password_feature/presentation/view/forget_password_view.dart';
import 'package:go_router/go_router.dart';



abstract class AppRouter {
  static const kOnBoarding = '/kOnBoarding';
  static const kLogin = '/Login';
  static const kRegister = '/Register';
  static const kHome = '/Home';
  static const kBookDetails = '/BookDetails';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>   const ForgetPasswordView(),
      ),
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
