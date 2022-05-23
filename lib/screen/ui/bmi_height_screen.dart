import 'package:bmi_project/screen/ui/bmi_weight_screen.dart';
import 'package:flutter/material.dart';
import 'package:height_slider/height_slider.dart';

import '../../constant/constant.dart';
import '../../helper/global_widget.dart';

class BmiHeightScreen extends StatefulWidget {
  const BmiHeightScreen({Key? key}) : super(key: key);

  @override
  State<BmiHeightScreen> createState() => _BmiHeightScreenState();
}

class _BmiHeightScreenState extends State<BmiHeightScreen> {
  int height = 170;

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
                "height".toUpperCase(),
                style: boldStyle,
              ),
            ],
          )),
      body: Column(
        children: [
          Expanded(
            child: HeightSlider(
              height: height,
              primaryColor: Colors.blueGrey[300],
              currentHeightTextColor: Colors.blueGrey[300],
              numberLineColor: Colors.blueGrey[300],
              onChange: (val) => setState(() => height = val),
              unit: 'cm', // optional
            ),
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
                child: buttonNext(context, "next"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BmiWeightScreen(height: height),
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
