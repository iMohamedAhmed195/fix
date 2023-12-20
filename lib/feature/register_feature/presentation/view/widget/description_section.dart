import 'package:fix/core/services/services_locator.dart';
import 'package:fix/feature/register_feature/presentation/controller/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/enums/craft_type.dart';
import '../../../../../core/utils/enums/user_type.dart';

class ChooseCraftSection extends StatelessWidget {
  const ChooseCraftSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h),
          child: Visibility(
            visible: sl<RegisterCubit>().userType == UserType.worker,
            child: SizedBox(
              height: 60.0.h,
              width: double.infinity,
              child: DropdownButtonFormField(
                items: CraftType.values.map((CraftType craftType) {
                  return DropdownMenuItem<CraftType>(
                    value: craftType,
                    child: Text(craftType.value),
                  );
                }).toList(),
                onChanged: (value) {
                  sl<RegisterCubit>().changeCraftType(craftType: value);
                },
                hint: const Text('Choose Your Craft'),
                iconSize: 30.0.r,
                decoration: InputDecoration(
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
        );
      },
    );
  }
}
