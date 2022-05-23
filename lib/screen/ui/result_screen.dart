import 'package:bmi_project/constant/constant.dart';
import 'package:bmi_project/helper/bmi_calculator.dart';
import 'package:bmi_project/screen/ui/bmi_gender.dart';
import 'package:flutter/material.dart';

import '../../helper/global_widget.dart';

class ResultScreen extends StatelessWidget {
  final double bmi;
  const ResultScreen({Key? key, required this.bmi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BmiCalculator bmiCalculator = BmiCalculator.fromBmiValue(bmi);
    bmiCalculator.determineBmiCategory();
    bmiCalculator.getHealtDescription();

    return Scaffold(
      backgroundColor: appBarColor,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your ".toUpperCase(),
                style: appBarStyle,
              ),
              Text(
                "summary".toUpperCase(),
                style: boldStyle,
              ),
            ],
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 6.0,
                      offset: Offset(1.0, 3.0))
                ]),
            child: Column(
              children: [
                Text(
                  "Your BMI is",
                  style: boldStyle.copyWith(
                      fontSize: 24, color: Colors.blueGrey[300]),
                ),
                Text(
                  bmi.toStringAsFixed(1),
                  style: heightTextStyle.copyWith(
                      fontSize: 100, color: Colors.blueGrey[300]),
                ),
                Text(
                  "kg/m2",
                  style: boldStyle.copyWith(
                      fontSize: 14,
                      color: Colors.blueGrey[300],
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  bmiCalculator.bmiCategory ?? "",
                  style: boldStyle.copyWith(
                      fontSize: 14, color: Colors.blueGrey[300]),
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            bmiCalculator.bmiDescription ?? "",
            textAlign: TextAlign.center,
            style:
                boldStyle.copyWith(fontSize: 20, color: Colors.blueGrey[300]),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                  child: buttonBack(context),
                  onPressed: () => Navigator.pop(context)),
              MaterialButton(
                child: buttonBMI(context, "Reset BMI"),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BmiGenderScreen(),
                      ),
                      (Route<dynamic> route) => false);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
