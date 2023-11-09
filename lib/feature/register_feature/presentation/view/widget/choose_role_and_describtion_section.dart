import 'package:fix/core/services/services_locator.dart';
import 'package:fix/feature/register_feature/presentation/controller/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoleAndDescriptionSection extends StatelessWidget {
  const RoleAndDescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: RadioListTile<String>(
                  value: "worker",
                  groupValue: sl<RegisterCubit>().type,
                  title:  Text(
                    'Worker',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0.sp,
                      fontFamily: 'Mulish',
                    ),
                  ),
                  tileColor: Colors.deepPurple.shade50,
                  dense: true,
                  contentPadding:  EdgeInsets.all(0.0.r),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(50.0.r)),
                  onChanged: (value) {
                    print(value);
                    sl<RegisterCubit>().selectValue(value!);
                  },
                ),
              ),
               SizedBox(
                width: 10.0.w,
              ),
              Expanded(
                child: RadioListTile<String>(
                  //content
                  value: "customer",
                  groupValue: sl<RegisterCubit>().type,
                  title:  Text(
                    'Customer',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0.sp,
                      fontFamily: 'Mulish',
                    ),
                  ),
                  tileColor: Colors.deepPurple.shade50,
                  contentPadding:  EdgeInsets.only(left:0.r),
                  dense: true,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(50.0.r)),
                  onChanged: (value) {
                    sl<RegisterCubit>().selectValue(value!);
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h),
          child: Visibility(
            visible: sl<RegisterCubit>().isWorker,
            child: SizedBox(
              height: 60.0.h,
              width: double.infinity,
              child: DropdownButtonFormField(
                items: sl<RegisterCubit>().craftList
                    .map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (value) {
                  sl<RegisterCubit>().changeOption(value.toString());
                },
                hint: const Text('Choose Your Craft'),
                iconSize: 30.0.r,
                decoration:  InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0.r),
                    ),
                  ),
                ),
                elevation: 10,
                iconEnabledColor: Colors.blue,
                iconDisabledColor: Colors.black12,
                isExpanded: true,
                borderRadius: BorderRadius.circular(50.0.r),
                dropdownColor: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
