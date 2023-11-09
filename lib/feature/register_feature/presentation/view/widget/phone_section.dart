import 'package:fix/core/services/services_locator.dart';
import 'package:fix/core/utils/constants/colors.dart';
import 'package:fix/feature/register_feature/presentation/controller/register_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneSection extends StatelessWidget {
  const PhoneSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h),
      child: InternationalPhoneNumberInput(
        textFieldController:
        sl<RegisterCubit>().phoneController,
        selectorConfig:  SelectorConfig(
          setSelectorButtonAsPrefixIcon: true,
          selectorType: PhoneInputSelectorType.DIALOG,
            leadingPadding:10.w
        ),
        inputDecoration: const InputDecoration(

          label: Text('Phone Number',
            style: TextStyle(color: Styles.kPrimaryColor),),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Styles.kPrimaryColor)),
        ),
        formatInput: true,
        onInputChanged: (PhoneNumber phoneNumber) {
          RegisterCubit.get(context).changePhone(phoneNumber.phoneNumber!);
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a valid phone number';
          }
          return null;
        },
        onSaved: (phoneNumber) {
          sl<RegisterCubit>().phoneController.text =
          phoneNumber.phoneNumber!;

        },
      ),
    );
  }
}
