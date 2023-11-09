import 'package:fix/feature/register_feature/presentation/view/widget/component_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageNationalIdSection extends StatelessWidget {
  const ImageNationalIdSection({super.key});

  @override
  Widget build(BuildContext context) {
    return      Padding(
      padding:  EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h),
      child: MaterialButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => const BottomSheetForNid());
        },
        child:  Row(
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
    );
  }
}
