import 'package:flutter/material.dart';

import '../../../core/appcolors.dart';

class textForm1 extends StatelessWidget {
  final Widget label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  bool? isPassword;

  textForm1({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
    this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(91, 175, 171, 171), width: 0.8),
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
        filled: true,
        fillColor: AppColors.textFormColor,
        label: label,
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      controller: this.controller,
      validator: this.validator,
      obscureText: isPassword == null ? false : true,
    );
  }
}
