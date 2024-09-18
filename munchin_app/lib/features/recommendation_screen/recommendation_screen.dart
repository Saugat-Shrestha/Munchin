import 'package:flutter/material.dart';

class RecommendationPart extends StatefulWidget {
  const RecommendationPart({super.key});

  @override
  State<RecommendationPart> createState() => _RecommendationPartState();
}

class _RecommendationPartState extends State<RecommendationPart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("recommendations"),
        Container(),
      ],
    );
  }
}
