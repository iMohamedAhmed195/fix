import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fix/core/services/services_locator.dart';
import 'package:fix/core/services/show_toast.dart';
import 'package:fix/core/utils/constants/colors.dart';
import 'package:fix/core/utils/enums/user_type.dart';
import 'package:fix/core/widget_components/custom_button.dart';
import 'package:fix/feature/login_feature/presentation/view/login_view.dart';
import 'package:fix/feature/register_feature/presentation/controller/register_cubit.dart';
import 'package:fix/feature/register_feature/presentation/view/widget/address_section.dart';
import 'package:fix/feature/register_feature/presentation/view/widget/choose_role_section.dart';
import 'package:fix/feature/register_feature/presentation/view/widget/city_section.dart';
import 'package:fix/feature/register_feature/presentation/view/widget/confirm_password_section.dart';
import 'package:fix/feature/register_feature/presentation/view/widget/description_section.dart';
import 'package:fix/feature/register_feature/presentation/view/widget/email_section.dart';
import 'package:fix/feature/register_feature/presentation/view/widget/image_national_id.dart';
import 'package:fix/feature/register_feature/presentation/view/widget/image_profile_section.dart';
import 'package:fix/feature/register_feature/presentation/view/widget/name_section.dart';
import 'package:fix/feature/register_feature/presentation/view/widget/national_id_section.dart';
import 'package:fix/feature/register_feature/presentation/view/widget/phone_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'birthday_section.dart';
import 'password_section.dart';

class RegisterOfTextFieldForRegister extends StatelessWidget {
  const RegisterOfTextFieldForRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            showToast(text: 'Register Success', state: ToastState.success);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginView()));
          } else if (state is RegisterErrorState) {
            showToast(text: state.errorMessage, state: ToastState.error);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(15.0.r),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 10.h),
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: Styles.kPrimaryColor, width: 3.w)),
              child: Form(
                key: sl<RegisterCubit>().registerKey,
                child: Column(
                  children: [
                    const ImageProfileSection(),
                    const NameSection(),
                    const EmailSection(),
                    const PasswordSection(),
                    const ConfirmPasswordSection(),
                    const PhoneSection(),
                    const BirthDateSection(),
                    const CitySectionComponent(),
                    const AddressSection(),
                    const NationalIdSection(),
                    const ImageNationalIdSection(),
                    const ChooseRoleSection(),
                    const ChooseCraftSection(),
                     ConditionalBuilder(
                       condition: state is RegisterLoadingState,
                       builder: (context) {
                         return const Center(child: CircularProgressIndicator(),);
                       },
                       fallback: (context) {
                         return CustomButton(
                           buttonName: 'Register',
                           function: () {
                             if (sl<RegisterCubit>()
                                 .registerKey
                                 .currentState!
                                 .validate() &&
                                 sl<RegisterCubit>().nIDFile != null) {
                               sl<RegisterCubit>().validateUserTypeAndWorkerCraft();
                             }
                           },
                         );
                       },
                     ),

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
