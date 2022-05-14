import 'package:bmi_project/constant/constant.dart';

class BmiCalculator {
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;

  BmiCalculator({
    required this.height,
    required this.weight,
  });

  BmiCalculator.fromBmiValue(this.bmi) {
    //
  }

  double calculate() {
    double heightInMeter = height! / 100;
    final h = (heightInMeter * heightInMeter);
    bmi = weight! / h;

    return bmi!;
  }

  String determineBmiCategory() {
    String category = "";
    if (bmi! < 16.0) {
      category = underweightSevere;
    } else if (bmi! < 17) {
      category = underweightModerate;
    } else if (bmi! < 18.5) {
      category = underweightMild;
    } else if (bmi! < 25) {
      category = normal;
    } else if (bmi! < 30) {
      category = overweight;
    } else if (bmi! < 35) {
      category = obesel1;
    } else if (bmi! < 40) {
      category = obesel2;
    } else if (bmi! >= 40) {
      category = obesel3;
    }

    bmiCategory = category;
    return bmiCategory!;
  }

  getHealtDescription() {
    String desc = "";

    switch (bmiCategory) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        desc = "Possible nutritional definiency and osteoporosis.";
        break;
      case normal:
        desc = "Low risk (healty range).";
        break;
      case overweight:
      case obesel1:
      case obesel2:
      case obesel3:
        desc =
            "Moderate risk of developing heart disease, hight blood pressure, stroke, diabetes mellitus.";
        break;
    }
    bmiDescription = desc;
    return bmiDescription;
  }
}
