import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final String? text;
  final Color? dividerColor;
  final Color? textColor;

  const CustomDivider({
    Key? key,
    this.text,
    this.dividerColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(color: dividerColor ?? Colors.black),
        ),
        if (text != null && text!.isNotEmpty) ...[
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .025),
            child: Text(
              text!,
              style: TextStyle(color: textColor),
            ),
          ),
          Expanded(
            child: Divider(color: dividerColor ?? Colors.black),
          ),
        ]
      ],
    );
  }
}
