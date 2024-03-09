import 'package:fix/core/services/services_locator.dart';
import 'package:fix/core/services/show_toast.dart';
import 'package:fix/core/utils/constants/colors.dart';
import 'package:fix/core/utils/constants/strings.dart';
import 'package:fix/core/utils/enums/user_type.dart';
import 'package:fix/core/utils/go_routes/route_names.dart';
import 'package:fix/core/widget_components/custom_button.dart';
import 'package:fix/core/widget_components/custom_text_form_field.dart';
import 'package:fix/feature/login_feature/presentation/controller/login_cubit.dart';
import 'package:fix/feature/timeline/timeline_user/timeline_user.dart';
import 'package:fix/feature/timeline/timeline_worker/timeline_worker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class ContainerOfTextField extends StatelessWidget {
  const ContainerOfTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if(state is LoginSuccessState){
            showToast(text: 'Login Success', state: ToastState.success);
            Strings.token = state.loginEntity.token;
            if(state.loginEntity.role ==UserType.customer){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TimeLineForUser()));
            }else{
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TimeLineForWorker()));
            }

          }else if(state is LoginErrorState){
            showToast(text: 'Login Error', state: ToastState.error);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Styles.kPrimaryColor, width: 3)),
              child: Form(
                key: sl<LoginCubit>().formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      hintText: 'Email',
                      function: (value) {
                        if (value!.isEmpty) {
                          return 'enter your email';
                        }
                        return null;
                      },
                      iconPrefix: Icons.email,
                      controller: sl<LoginCubit>().emailController,
                      obSecure: false,
                      inputType: TextInputType.text,
                    ),
                    CustomTextFormField(
                      hintText: 'Password',
                      function: (value) {
                        if (value!.isEmpty) {
                          return 'enter your password';
                        }
                        return null;
                      },
                      iconPrefix: Icons.lock,
                      controller: sl<LoginCubit>().passwordController,
                      obSecure: true,
                      inputType: TextInputType.visiblePassword,
                      iconSuffix: Icons.remove_red_eye,
                    ),
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.kForgetPassword);
                      },
                      child: const Text('Forget Password',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Styles.kPrimaryColor,
                          )),

                    ),

                    CustomButton(
                      buttonName: 'Login',
                      function: () {
                        if(sl<LoginCubit>().formKey.currentState!.validate()){
                          sl<LoginCubit>().logInApp();
                        }
                      },
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
