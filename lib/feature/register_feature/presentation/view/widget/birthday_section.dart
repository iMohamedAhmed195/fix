import 'package:fix/core/services/services_locator.dart';
import 'package:fix/core/utils/constants/colors.dart';
import 'package:fix/feature/register_feature/presentation/controller/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BirthDateSection extends StatelessWidget {
  const BirthDateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h),
      child: Row(
        children: [
          //  SizedBox(width: 20.0,),
          Expanded(
            child: TextFormField(
              controller:
              sl<RegisterCubit>().dayController,
              decoration: const InputDecoration(label: Text('Day',
                style: TextStyle(color: Styles.kPrimaryColor),),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Styles.kPrimaryColor)),),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a day';
                }
                // Add any additional validation rules for the day field here
                return null;
              },
            ),
          ),
           SizedBox(width: 10.w),
          Expanded(
            child: TextFormField(
              controller:
              sl<RegisterCubit>().monthController,
              decoration: const InputDecoration(label: Text('Month',
                style: TextStyle(color: Styles.kPrimaryColor),),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Styles.kPrimaryColor)),),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a month';
                }
                // Add any additional validation rules for the month field here
                return null;
              },
            ),
          ),
           SizedBox(width: 10.w),
          Expanded(
            child: TextFormField(
              controller:
              sl<RegisterCubit>().yearController,
              decoration: const InputDecoration(label: Text('Year',
                style: TextStyle(color: Styles.kPrimaryColor),),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Styles.kPrimaryColor)),),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a year';
                }
                // Add any additional validation rules for the year field here
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
