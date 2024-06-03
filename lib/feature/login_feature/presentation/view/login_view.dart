import 'package:fix/feature/login_feature/presentation/view/widget/login_view_body.dart';
import 'package:flutter/material.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: SafeArea(child: LoginViewBody()) ,
    );
  }
}
