import 'package:bmi_project/constant/constant.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GenderSelectorWidget extends StatelessWidget {
  String? image;
  String? gender;
  GenderSelectorWidget({Key? key, this.image, this.gender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
                blurRadius: 6.0,
                color: Colors.blueGrey,
                offset: Offset(1.0, 3.0))
          ],
          border: Border.all(color: Colors.grey)),
      child: Column(
        children: [
          Image.asset(
            image!,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            gender!,
            style: boldStyle.copyWith(fontSize: 16),
          )
        ],
      ),
    );
  }
}
