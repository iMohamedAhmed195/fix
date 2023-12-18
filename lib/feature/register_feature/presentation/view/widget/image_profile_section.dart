import 'package:fix/core/services/services_locator.dart';
import 'package:fix/core/utils/constants/colors.dart';
import 'package:fix/feature/register_feature/presentation/controller/register_cubit.dart';
import 'package:fix/feature/register_feature/presentation/view/widget/component_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageProfileSection extends StatelessWidget {
  const ImageProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: 12.0.h),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 80.r,
                backgroundImage: FileImage(sl<RegisterCubit>().profileImage),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  bottom: 7.0.h,
                  end: 7.0.w,
                ),
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Styles.kPrimaryColor,
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => const BottomSheets());
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
