import 'package:fix/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';



class ImageAndTextSection extends StatelessWidget {
  const ImageAndTextSection({super.key, required this.namePage});

  final String namePage ;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Text(
          namePage,
          style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 28,
              color: Styles.kPrimaryColor
          ),
        )
      ],
    );
  }
}
