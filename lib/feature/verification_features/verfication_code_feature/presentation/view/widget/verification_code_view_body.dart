import 'package:fix/core/utils/constants/colors.dart';
import 'package:fix/core/widget_components/custom_button.dart';
import 'package:fix/core/widget_components/custom_text_form_field.dart';
import 'package:fix/core/widget_components/image_text_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationViewBody extends StatelessWidget {
   VerificationViewBody({super.key});
  var verificationCodeController= TextEditingController();
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
                        hintText: 'Your Code',
                        iconPrefix: Icons.numbers,
                        controller: verificationCodeController,
                        obSecure: false,
                        inputType: TextInputType.number,
                        function: (value){
                          return null ;
                        },
                    ),

                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Text(
                        'resend?',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Styles.kPrimaryColor
                        ),
                      ),
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
