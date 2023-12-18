import 'package:fix/core/services/services_locator.dart';
import 'package:fix/feature/register_feature/presentation/controller/register_cubit.dart';import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///bottom sheet for image profile
class BottomSheets extends StatelessWidget {
  const BottomSheets({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      //padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      width: double.infinity,
      height: size.height * 0.3,
      margin: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 10.0.w),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        // color: color,
      ),
      // color: Colors.black,
      child: Column(
        children: [
          Text(
            'Choose a Profile Photo',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 20.0.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      sl<RegisterCubit>().getImageProfileFromGallery();
                    },
                    child: const Icon(
                      Icons.image,
                      color: Color(0xff4377ec),
                    ),
                  ),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  Text(
                    'Gallery',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0.sp,
                      color: const Color(0xff4377ec),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 80.0.w,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      sl<RegisterCubit>().getImageProfileFromCamera();
                    },
                    child: const Icon(
                      Icons.camera,
                      color: Color(0xff4377ec),
                    ),
                  ),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  Text(
                    'Camera',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0.sp,
                      color: const Color(0xff4377ec),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

///bottom sheet for national id
class BottomSheetForNid extends StatelessWidget {
  const BottomSheetForNid({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.3,
      margin:  EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 10.0.w),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Column(
        children: [
           Text(
            'Choose a Profile Photo',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0.sp,
              color: Colors.black,
            ),
          ),
           SizedBox(
            height: 50.0.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      sl<RegisterCubit>().getImageNIDFromGallery();
                    },
                    child: const Icon(
                      Icons.image,
                      color: Color(0xff4377ec),
                    ),
                  ),
                   SizedBox(
                    height: 10.0.h,
                  ),
                   Text(
                    'Gallery',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0.sp,
                      color: const Color(0xff4377ec),
                    ),
                  ),
                ],
              ),
               SizedBox(
                width: 80.0.w,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      sl<RegisterCubit>().getImageNIDFromCamera();
                    },
                    child: const Icon(
                      Icons.camera,
                      color: Color(0xff4377ec),
                    ),
                  ),
                   SizedBox(
                    height: 10.0.h,
                  ),
                   Text(
                    'Camera',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0.sp,
                      color: const Color(0xff4377ec),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
