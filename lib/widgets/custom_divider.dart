import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final String? text;
  final EdgeInsets? padding;

  const CustomDivider({
    Key? key,
    this.padding,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * .025),
      child: Row(
        children: [
          const Expanded(
            child: Divider(),
          ),
          if (text != null && text!.isNotEmpty) ...[
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .025),
              child: Text(
                text!,
              ),
            ),
            const Expanded(
              child: Divider(),
            ),
          ]
        ],
      ),
    );
  }
}
