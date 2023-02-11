import 'package:flutter/material.dart';

class MealPlanTab extends StatefulWidget {
  const MealPlanTab({
    Key? key,
  }) : super(key: key);

  @override
  State<MealPlanTab> createState() => _MealPlanTabState();
}

class _MealPlanTabState extends State<MealPlanTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
