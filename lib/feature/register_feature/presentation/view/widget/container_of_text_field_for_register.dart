import 'package:fix/core/services/services_locator.dart';
import 'package:fix/core/services/show_toast.dart';
import 'package:fix/core/utils/constants/colors.dart';
import 'package:fix/core/widget_components/custom_button.dart';
import 'package:fix/feature/register_feature/presentation/controller/register_cubit.dart';
import 'package:fix/feature/register_feature/presentation/view/widget/address_and_id_section.dart';
import 'package:fix/feature/register_feature/presentation/view/widget/choose_role_and_describtion_section.dart';
import 'package:fix/feature/register_feature/presentation/view/widget/image_national_id.dart';
import 'package:fix/feature/register_feature/presentation/view/widget/image_profile_section.dart';
import 'package:fix/feature/register_feature/presentation/view/widget/name_and_email_section.dart';
import 'package:fix/feature/register_feature/presentation/view/widget/phone_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'birthday_section.dart';
import 'password_and_confirm_section.dart';


class ContainerOfTextFieldForRegister extends StatelessWidget {
  const ContainerOfTextFieldForRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
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
          } else if (state is RegisterError) {
            showToast(text: 'Register Error', state: ToastState.error);
          }
        },
        builder: (context, state) {
          return Padding(
            padding:  EdgeInsets.all(15.0.r),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: Styles.kPrimaryColor, width: 3.w)),
              child: Form(
                key: sl<RegisterCubit>().registerKey,
                child: Column(
                  children: [
                    const ImageProfileSection(),
                    const NameAndEmailSection(),
                    const PasswordAndConfirmSection(),
                    const PhoneSection(),
                    const BirthDateSection(),
                    const AddressAndNationalIdSection(),
                    const ImageNationalIdSection(),
                    const RoleAndDescriptionSection(),
                    CustomButton(
                      buttonName: 'Register',
                      function: () {
                        if (sl<RegisterCubit>()
                            .registerKey
                            .currentState!
                            .validate()) {
                          // sl<RegisterCubit>().registerInApp();
                        }
                      },
                    )
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


