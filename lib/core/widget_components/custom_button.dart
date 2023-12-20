import 'package:fix/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.function, required this.buttonName, this.buttonColor ,});

  final void Function() function ;
  final String buttonName ;
  final Color? buttonColor ;
  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding:  EdgeInsets.only(right: 15.0.w,left: 15.0.w,),
      child: Container(
        width: double.infinity,
        height: 35.h,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r)
        ),
        child: MaterialButton(
          onPressed: function,
          color: buttonColor ?? Styles.kPrimaryColor,
          child: Text(
            buttonName,
            style:  TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700
            ),
          ),
        ),
      ),
    );
  }
}
