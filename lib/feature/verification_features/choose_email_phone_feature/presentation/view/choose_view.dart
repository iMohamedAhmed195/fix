import 'package:fix/feature/verification_features/choose_email_phone_feature/presentation/view/widget/choose_view_body.dart';
import 'package:flutter/material.dart';

class ChooseView extends StatelessWidget {
  const ChooseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ChooseViewBody()),
    );
  }
}
