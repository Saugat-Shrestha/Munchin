import 'package:flutter/material.dart';

const double onBoardValue = 50.0;
const double vBox0 = 20.0;
const double vBox1 = 5.0;
const double vBox2 = 40.0;

const SizedBox onboardingspace = SizedBox(
  height: onBoardValue,
);

const SizedBox vSizedBox0 = SizedBox(
  height: vBox0,
);
const SizedBox vSizedBox1 = SizedBox(
  height: vBox1,
);
const SizedBox vSizedBox2 = SizedBox(
  height: vBox2,
);

sizedBoxDynamic(BuildContext context, double value) {
  double appHeight = MediaQuery.of(context).size.height;
  return appHeight * value;
}
