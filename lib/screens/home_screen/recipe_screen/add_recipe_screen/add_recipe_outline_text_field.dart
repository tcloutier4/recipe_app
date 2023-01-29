import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_app/shared/constants.dart';

class AddRecipeOutlinedTextField extends StatelessWidget {
  final Key fieldKey;
  final String label;
  final bool textAllowed;
  final String? hintText;
  final void Function(String?)? onSubmitted;

  const AddRecipeOutlinedTextField({
    required this.fieldKey,
    required this.label,
    this.textAllowed = true,
    this.hintText,
    this.onSubmitted,
  }) : super(key: fieldKey);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(
          height: 25,
        ),
        TextField(
          keyboardType: textAllowed ? null : TextInputType.number,
          inputFormatters:
              textAllowed ? null : [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            filled: true,
            fillColor: colorFloralWhite,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: colorFloralWhite),
              borderRadius: BorderRadius.all(
                Radius.circular(40.0),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: colorFloralWhite),
              borderRadius: BorderRadius.all(
                Radius.circular(40.0),
              ),
            ),
            hintText: hintText ?? label,
            labelText: label,
          ),
          onSubmitted: onSubmitted,
        )
      ],
    );
  }
}
