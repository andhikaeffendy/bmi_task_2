import 'package:bmi_project/screen/ui/bmi_height_screen.dart';
import 'package:bmi_project/screen/widget/gender_selector_widget.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class BmiGenderScreen extends StatefulWidget {
  const BmiGenderScreen({Key? key}) : super(key: key);

  @override
  State<BmiGenderScreen> createState() => _BmiGenderScreenState();
}

class _BmiGenderScreenState extends State<BmiGenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Select Your ".toUpperCase(),
                style: appBarStyle,
              ),
              Text(
                "Gender".toUpperCase(),
                style: boldStyle,
              ),
            ],
          )),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BmiHeightScreen(),
                    )),
                child: GenderSelectorWidget(
                    image: "assets/male_icon.jpg", gender: "Male")),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BmiHeightScreen(),
                  )),
              child: GenderSelectorWidget(
                image: "assets/female_icon.jpg",
                gender: "Female",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
