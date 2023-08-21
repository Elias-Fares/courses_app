import 'package:flutter/material.dart';

import '../../../core/appcolors.dart';

class SignUpBtn extends StatelessWidget {
  final void Function()? onTap;
  const SignUpBtn({
    super.key, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.signUpBtnColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(5),
        bottomRight: Radius.circular(20),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(30),
      ),
      child: InkWell(
        onTap: this.onTap,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            bottomRight: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(30),
          ),
          
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: 50,
            alignment: Alignment.center,
            child: Text(
              "Sign Up",
              style: TextStyle(fontSize: 15, fontFamily: "inter", color: AppColors.white),
            ),
          )),
    );
  }
}