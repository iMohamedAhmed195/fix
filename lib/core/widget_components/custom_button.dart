import 'package:fix/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.function, required this.buttonName});

  final void Function() function ;
  final String buttonName ;

  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.only(right: 20.0,left: 20.0,bottom: 15),
      child: Container(
        width: double.infinity,
        height: 50,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
        ),
        child: MaterialButton(
          onPressed: function,
          color: Styles.kPrimaryColor,
          child: Text(
            buttonName,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700
            ),
          ),
        ),
      ),
    );
  }
}
