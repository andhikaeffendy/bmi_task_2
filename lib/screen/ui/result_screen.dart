import 'package:bmi_project/constant/constant.dart';
import 'package:bmi_project/model/bmi_calculator.dart';
import 'package:bmi_project/screen/widget/bmi_widget.dart';
import 'package:flutter/material.dart';

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
        title: const Text(
          "Result BMI",
          style: appBarStyle,
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Center(
            child: Text(
              "Your Result",
              textAlign: TextAlign.start,
              style: genderStyle.copyWith(
                  fontSize: 50, fontWeight: FontWeight.bold),
            ),
          )),
          Expanded(
              flex: 5,
              child: BmiWidget(
                widget: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        bmiCalculator.bmiCategory ?? "",
                        style: labelTextStyle.copyWith(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        bmi.toStringAsFixed(1),
                        style: heightTextStyle.copyWith(fontSize: 100),
                      ),
                      Text(
                        bmiCalculator.bmiDescription ?? "",
                        textAlign: TextAlign.center,
                        style: labelTextStyle.copyWith(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              )),
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 60,
              width: double.infinity,
              color: buttonColor,
              child: const Center(
                child: Text(
                  "RE-CALCULATE",
                  style: buttonStyle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
