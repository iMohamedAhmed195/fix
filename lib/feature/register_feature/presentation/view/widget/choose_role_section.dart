import 'package:fix/core/services/services_locator.dart';
import 'package:fix/feature/register_feature/presentation/controller/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/enums/user_type.dart';

class ChooseRoleSection extends StatelessWidget {
  const ChooseRoleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (BuildContext context, RegisterState state) {},
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: RadioListTile<UserType>(

                  value: UserType.worker,
                  groupValue: sl<RegisterCubit>().userType,
                  title: Text(

                    'Worker',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0.sp,
                      fontFamily: 'Mulish',
                    ),
                  ),
                  tileColor: Colors.deepPurple.shade50,
                  dense: true,
                  contentPadding: EdgeInsets.all(0.0.r),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0.r)),
                  onChanged: (value) {
                    sl<RegisterCubit>().selectValue(userType: value);
                  },
                ),
              ),
              SizedBox(
                width: 10.0.w,
              ),
              Expanded(
                child: RadioListTile<UserType>(
                  //content

                  value: UserType.customer,
                  groupValue: sl<RegisterCubit>().userType,
                  title: Text(
                    'Customer',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0.sp,
                      fontFamily: 'Mulish',
                    ),
                  ),
                  tileColor: Colors.deepPurple.shade50,
                  contentPadding: EdgeInsets.only(left: 0.r),
                  dense: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0.r)),
                  onChanged: (value) {
                    sl<RegisterCubit>().selectValue(userType: value);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
