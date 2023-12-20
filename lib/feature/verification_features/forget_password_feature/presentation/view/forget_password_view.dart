import 'package:fix/feature/verification_features/forget_password_feature/presentation/view/widget/forget_password_view_body.dart';
import 'package:flutter/material.dart';


class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: SafeArea(child: Padding(
      padding:  EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.28),
      child: ForgetPasswordViewBody(),
    )));
  }
}
