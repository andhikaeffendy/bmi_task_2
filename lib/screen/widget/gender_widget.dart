import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 70,
          color: Colors.white,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          title,
          style: genderStyle,
        )
      ],
    );
  }
}
