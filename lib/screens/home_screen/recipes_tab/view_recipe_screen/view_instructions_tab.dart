import 'package:flutter/material.dart';

class ViewInstructionsTab extends StatefulWidget {
  const ViewInstructionsTab({Key? key}) : super(key: key);

  @override
  State<ViewInstructionsTab> createState() => _ViewInstructionsTabState();
}

class _ViewInstructionsTabState extends State<ViewInstructionsTab> {
  late FocusNode myFocusNode;
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
