import 'package:fix/core/utils/constants/colors.dart';
import 'package:fix/core/utils/go_routes/route_names.dart';
import 'package:fix/core/widget_components/image_text_section.dart';
import 'package:fix/feature/login_feature/presentation/view/widget/container_of_text_field_for_login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.2,
              ),
              const ImageAndTextSection(
                namePage: 'Login Now!',
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Row(
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          GoRouter.of(context).push(AppRouter.kRegister);
                        },
                          child: const Text('Register Now!',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Styles.kPrimaryColor,
                              )),
      
                        ),

      
                  ],
                ),
              ),
              const LoginOfTextField()
            ],
          )),
    );
  }
}
