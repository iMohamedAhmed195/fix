import 'package:fix/core/utils/constants/colors.dart';
import 'package:fix/core/widget_components/custom_button.dart';
import 'package:fix/core/widget_components/custom_text_form_field.dart';
import 'package:fix/core/widget_components/image_text_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPasswordViewBody extends StatelessWidget {
   NewPasswordViewBody({super.key});
  var newPasswordController = TextEditingController();
  var confirmNewPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.2),
          child: const ImageAndTextSection(
            namePage: 'Enter your code',
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.0.r),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: Styles.kPrimaryColor, width: 3.w)),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      hintText: 'New Password',
                      iconPrefix: Icons.lock_outline,
                      controller: newPasswordController,
                      obSecure: false,
                      inputType: TextInputType.visiblePassword,
                      function: (value){
                        return null ;
                      },
                    ),
                    CustomTextFormField(
                      hintText: 'Confirm Password',
                      iconPrefix:  Icons.lock_outline,
                      controller: confirmNewPasswordController,
                      obSecure: false,
                      inputType: TextInputType.visiblePassword,
                      function: (value){
                        return null ;
                      },
                    ),

                    SizedBox(height: 20.h,),
                    CustomButton(
                      function: () {},
                      buttonName: 'Next',
                    ),
                    SizedBox(height: 15.h,),
                    CustomButton(
                      function: () {},
                      buttonName: 'Cancel',
                      buttonColor: Colors.grey[400],
                    ),
                    SizedBox(height: 15.h,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
