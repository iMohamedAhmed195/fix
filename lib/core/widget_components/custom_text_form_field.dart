import 'package:fix/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.iconPrefix,
      this.function,
      required this.controller,
      required this.obSecure,
      required this.inputType,
      this.iconSuffix,
      this.sufFunction,
      this.formatList});

  final String hintText;
  final IconData iconPrefix;
  final IconData? iconSuffix;
  final String? Function(String?)? function;
  final void Function()? sufFunction;
  final TextEditingController controller;
  final bool obSecure;
  final TextInputType inputType;
  final List<TextInputFormatter>? formatList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 15.h),
      child: TextFormField(
        inputFormatters: formatList,
        validator: function,
        decoration: InputDecoration(
            label: Text(
              hintText,
              style: const TextStyle(color: Styles.kPrimaryColor),
            ),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Styles.kPrimaryColor)),
            prefixIcon: Icon(
              iconPrefix,
              color: Styles.kPrimaryColor,
            ),
            suffixIcon: IconButton(
                onPressed: sufFunction,
                icon: Icon(
                  iconSuffix,
                  color: Styles.kPrimaryColor,
                ))),
        controller: controller,
        obscureText: obSecure,
        keyboardType: inputType,
      ),
    );
  }
}
