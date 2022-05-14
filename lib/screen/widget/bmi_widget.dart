import 'package:bmi_project/constant/constant.dart';
import 'package:flutter/material.dart';

class BmiWidget extends StatelessWidget {
  const BmiWidget({Key? key, this.widget, this.borderColor = appBarColor})
      : super(key: key);

  final Widget? widget;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(color: borderColor!, width: 2),
          borderRadius: BorderRadius.circular(8),
          color: genderSelectedColor),
      child: widget,
    );
  }
}
