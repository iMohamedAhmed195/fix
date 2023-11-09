import 'package:fix/core/services/services_locator.dart';
import 'package:fix/core/services/show_toast.dart';
import 'package:fix/core/utils/constants/colors.dart';
import 'package:fix/core/widget_components/custom_button.dart';
import 'package:fix/core/widget_components/custom_text_form_field.dart';
import 'package:fix/feature/presentation/controller/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ContainerOfTextFieldForRegister extends StatelessWidget {
  const ContainerOfTextFieldForRegister({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if(state is RegisterSuccess){
            showToast(text: 'Register Success', state: ToastState.success);
            // Strings.token = state.registerModel.data!.token!;
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => HomeView(
            //           imageProfile: state.registerModel.data!.user!.image!,
            //           nameProfile: state.registerModel.data!.user!.name!,
            //           emailProfile:state.registerModel.data!.user!.email!,
            //         )));
          }else if(state is RegisterError){
            showToast(text: 'Register Error', state: ToastState.error);
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
                key: sl<RegisterCubit>().registerKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      hintText: 'Name',
                      function: (value){
                          if(value!.isEmpty){
                           return 'enter your name';
                          }
                          return null ;
                      },
                      iconPrefix: Icons.person,
                      controller: sl<RegisterCubit>().nameController,
                      obSecure: false,
                      inputType: TextInputType.text,
                    ),
                    CustomTextFormField(
                      hintText: 'Email',
                      function: (value){
                        if(value!.isEmpty){
                          return 'enter your email';
                        }
                        return null ;
                      },
                      iconPrefix: Icons.email,
                      controller: sl<RegisterCubit>().emailController,
                      obSecure: false,
                      inputType: TextInputType.emailAddress,
                    ),
                    CustomTextFormField(
                      hintText: 'Password',
                      function: (value){
                        if(value!.isEmpty){
                          return 'enter your password';
                        }
                        return null ;
                      },
                      iconPrefix: Icons.lock,
                      controller: sl<RegisterCubit>().passwordController,
                      obSecure: true,
                      inputType: TextInputType.visiblePassword,
                      iconSuffix: Icons.remove_red_eye,
                    ),

                    CustomTextFormField(
                      hintText: 'Confirm Password',
                      function: (value){
                        if(value!.isEmpty){
                          return 'enter your password again';
                        }
                        return null ;
                      },
                      iconPrefix: Icons.lock,
                      controller: sl<RegisterCubit>().confirmPasswordController,
                      obSecure: true,
                      inputType: TextInputType.visiblePassword,
                    ),
                    CustomButton(buttonName: 'Register', function: () {

                      if( sl<RegisterCubit>().registerKey.currentState!.validate()) {
                        // sl<RegisterCubit>().registerInApp();
                      }
                    },)
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
