import 'package:flutter/material.dart';

import '../core/app_colors.dart';

typedef validationFunction = String? Function(String?)?;

class CustomTextFiled extends StatelessWidget {
  TextEditingController controller;
  String text;
  validationFunction validator;
  TextInputType type;

  CustomTextFiled(
      {super.key,
      required this.controller,
      required this.text,
      required this.validator,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUnfocus,
      style: TextStyle(
        color: Colors.white,
      ),
      validator: validator,
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        hintText: text,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: AppColors.white, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: AppColors.white, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: AppColors.white, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: AppColors.red, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: AppColors.white, width: 2),
        ),
      ),
    );
  }
}
