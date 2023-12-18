import 'package:fix/core/services/services_locator.dart';
import 'package:fix/feature/register_feature/presentation/controller/register_cubit.dart';
import 'package:fix/feature/register_feature/presentation/view/widget/component_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageNationalIdSection extends StatelessWidget {
  const ImageNationalIdSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h),
          child: Column(
            children: [
              MaterialButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => const BottomSheetForNid());
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.add_a_photo,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 8.0.w),
                    const Text('Upload Your NID Photo'),
                  ],
                ),
              ),
              if (sl<RegisterCubit>().nIDImage == null)
                Padding(
                  padding: EdgeInsets.only(top: 8.0.h),
                  child: const Text(
                    'Please upload your NID photo.',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
