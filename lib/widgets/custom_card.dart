import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final Function()? onLongPress;
  final ShapeBorder? shape;
  final double? elevation;

  const CustomCard({
    Key? key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.shape,
    this.elevation = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      shape: shape ??
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .05,
            vertical: MediaQuery.of(context).size.height * .025,
          ),
          child: child,
        ),
      ),
    );
  }
}
