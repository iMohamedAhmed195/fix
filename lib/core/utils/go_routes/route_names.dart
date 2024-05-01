import 'package:fix/feature/Onboarding_Screens/onbording.dart';
import 'package:fix/feature/register_feature/presentation/view/register_view.dart';
import 'package:fix/feature/verification_features/choose_email_phone_feature/presentation/view/choose_view.dart';
import 'package:fix/feature/verification_features/forget_password_feature/presentation/view/forget_password_view.dart';
import 'package:fix/feature/verification_features/new_password_feature/presentation/view/new_password_view.dart';
import 'package:fix/feature/verification_features/verfication_code_feature/presentation/view/verification_code_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kOnBoarding = '/kOnBoarding';
  static const kLogin = '/';
  static const kRegister = '/Register';
  static const kChooseEmailPhone = '/ChooseEmailPhone';
  static const kForgetPassword = '/ForgetPassword';
  static const kNewPassword = '/NewPassword';
  static const kVerificationCode = '/VerificationCode';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kLogin,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: kForgetPassword,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: kRegister,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: kChooseEmailPhone,
        builder: (context, state) => const ChooseView(),
      ),
      GoRoute(
        path: kNewPassword,
        builder: (context, state) => const NewPasswordView(),
      ),
      GoRoute(
        path: kVerificationCode,
        builder: (context, state) => const VerificationView(),
      ),
    ],
  );
}
