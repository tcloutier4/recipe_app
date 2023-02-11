import 'package:flutter/material.dart';

class GroceryListTab extends StatefulWidget {
  const GroceryListTab({
    Key? key,
  }) : super(key: key);

  @override
  State<GroceryListTab> createState() => _GroceryListTabState();
}

class _GroceryListTabState extends State<GroceryListTab> {
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
