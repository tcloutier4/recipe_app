import 'package:flutter/material.dart';
import 'package:recipe_app/shared/constants.dart';

class AddRecipeOutlinedTextField extends StatelessWidget {
  final Key fieldKey;
  final String? label;
  final String? hintText;
  final TextEditingController controller;

  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  const AddRecipeOutlinedTextField({
    required this.fieldKey,
    required this.label,
    this.hintText,
    required this.controller,
    required this.onSaved,
    this.validator,
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
        TextFormField(
          key: fieldKey,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: colorFloralWhite,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: colorFloralWhite),
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: colorFloralWhite),
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            hintText: hintText ?? label,
          ),
          onSaved: onSaved,
          validator: validator,
        )
      ],
    );
  }
}
