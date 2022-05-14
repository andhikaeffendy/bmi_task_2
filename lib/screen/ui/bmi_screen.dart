import 'package:bmi_project/constant/constant.dart';
import 'package:bmi_project/model/bmi_calculator.dart';
import 'package:bmi_project/screen/ui/result_screen.dart';
import 'package:bmi_project/screen/widget/bmi_widget.dart';
import 'package:bmi_project/screen/widget/gender_widget.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  int height = 100;
  int weight = 50;
  int age = 20;
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarColor,
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: appBarStyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    gender = "male";
                    setState(() {});
                  },
                  child: BmiWidget(
                      borderColor:
                          (gender == "male") ? Colors.white : appBarColor,
                      widget:
                          const GenderWidget(icon: Icons.male, title: "Male")),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    gender = "female";
                    setState(() {});
                  },
                  child: BmiWidget(
                      borderColor:
                          (gender == "female") ? Colors.white : appBarColor,
                      widget: const GenderWidget(
                          icon: Icons.female, title: "Female")),
                ),
              ),
            ],
          )),
          Expanded(
            child: BmiWidget(
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: labelTextStyle.copyWith(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "$height",
                        style: heightTextStyle,
                      ),
                      const Text(
                        "cm",
                        style: labelTextStyle,
                      )
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      activeColor: Colors.white,
                      thumbColor: Colors.red,
                      min: 80,
                      max: 200,
                      onChanged: (value) {
                        height = value.toInt();
                        setState(() {});
                      })
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BmiWidget(
                    widget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "WEIGHT",
                          style: labelTextStyle,
                        ),
                        Text(
                          "$weight",
                          style: heightTextStyle,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                weight++;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: const Color(0xff212747),
                              constraints: const BoxConstraints.tightFor(
                                  width: 56, height: 56),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                weight--;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: const Color(0xff212747),
                              constraints: const BoxConstraints.tightFor(
                                  width: 56, height: 56),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: BmiWidget(
                        widget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "AGE",
                      style: labelTextStyle,
                    ),
                    Text(
                      "$age",
                      style: heightTextStyle,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RawMaterialButton(
                          onPressed: () {
                            age++;
                            setState(() {});
                          },
                          elevation: 0,
                          shape: const CircleBorder(),
                          fillColor: const Color(0xff212747),
                          constraints: const BoxConstraints.tightFor(
                              width: 56, height: 56),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        RawMaterialButton(
                          onPressed: () {
                            age--;
                            setState(() {});
                          },
                          elevation: 0,
                          shape: const CircleBorder(),
                          fillColor: const Color(0xff212747),
                          constraints: const BoxConstraints.tightFor(
                              width: 56, height: 56),
                          child: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ))),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              final bmiCalculator =
                  BmiCalculator(height: height, weight: weight);
              bmiCalculator.calculate();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(bmi: bmiCalculator.bmi!),
                  ));
            },
            child: Container(
              height: 60,
              width: double.infinity,
              color: buttonColor,
              child: const Center(
                child: Text(
                  "Hitung BMI",
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
