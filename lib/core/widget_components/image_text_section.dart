import 'package:fix/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class ImageAndTextSection extends StatelessWidget {
  const ImageAndTextSection({super.key, required this.namePage});

  final String namePage ;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SizedBox(
        //     width: MediaQuery.sizeOf(context).width * 0.5,
        //     child: Image.asset(AssetsData.logIn,)
        // ),

        Padding(
          padding:  EdgeInsets.only(top: 80.0.h),
          child: Text(
            namePage,
            style:  TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 28.sp,
                color: Styles.kPrimaryColor
            ),
          ),
        )
      ],
    );
  }
}
