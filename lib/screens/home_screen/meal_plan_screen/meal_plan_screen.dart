import 'package:flutter/material.dart';
import 'package:recipe_app/shared/constants.dart';

class MealPlanScreen extends StatefulWidget {
  const MealPlanScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MealPlanScreen> createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends State<MealPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBrownTeddy,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
