import 'package:fix/features/verification_features/verfication_code_feature/presentation/view/widget/verification_code_view_body.dart';
import 'package:flutter/material.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: VerificationViewBody()),
    );
  }
}
