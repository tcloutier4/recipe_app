import 'package:flutter/material.dart';
import 'package:recipe_app/shared/constants.dart';

class GroceryListScreen extends StatefulWidget {
  const GroceryListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
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
