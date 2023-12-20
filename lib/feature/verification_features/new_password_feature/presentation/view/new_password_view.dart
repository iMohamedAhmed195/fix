import 'package:fix/feature/verification_features/new_password_feature/presentation/view/widget/new_password_view_body.dart';
import 'package:flutter/material.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: NewPasswordViewBody()),
    );
  }
}
