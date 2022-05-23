import 'package:bmi_project/screen/ui/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

import '../../constant/constant.dart';
import '../../helper/bmi_calculator.dart';
import '../../helper/global_widget.dart';

// ignore: must_be_immutable
class BmiWeightScreen extends StatefulWidget {
  int? height;
  BmiWeightScreen({Key? key, this.height}) : super(key: key);

  @override
  State<BmiWeightScreen> createState() => _BmiWeightScreenState();
}

class _BmiWeightScreenState extends State<BmiWeightScreen> {
  double weight = 50.0;
  late WeightSliderController _controller;

  @override
  void initState() {
    _controller = WeightSliderController(
        initialWeight: weight, minWeight: 0, interval: 0.1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Select Your ".toUpperCase(),
                style: appBarStyle,
              ),
              Text(
                "weight".toUpperCase(),
                style: boldStyle,
              ),
            ],
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: VerticalWeightSlider(
              controller: _controller,
              decoration: const PointerDecoration(
                width: 130.0,
                height: 3.0,
                largeColor: Color(0xFF898989),
                mediumColor: Color(0xFFC5C5C5),
                smallColor: Color(0xFFF0F0F0),
                gap: 30.0,
              ),
              onChanged: (double value) {
                setState(() {
                  weight = value;
                });
              },
              indicator: Container(
                height: 3.0,
                width: 200.0,
                alignment: Alignment.centerLeft,
                color: Colors.blueGrey[400],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "${weight.toStringAsFixed(1)} KG",
              style:
                  boldStyle.copyWith(fontSize: 30, color: Colors.blueGrey[300]),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                  child: buttonBack(context),
                  onPressed: () => Navigator.pop(context)),
              MaterialButton(
                child: buttonBMI(context, "Calculate bmi"),
                onPressed: () {
                  final bmiCalculator =
                      BmiCalculator(height: widget.height, weight: weight);
                  bmiCalculator.calculate();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ResultScreen(bmi: bmiCalculator.bmi!),
                      ));
                },
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
