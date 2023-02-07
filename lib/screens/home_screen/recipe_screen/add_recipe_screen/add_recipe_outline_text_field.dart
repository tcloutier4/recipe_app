import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_app/shared/constants.dart';

class AddRecipeOutlinedTextField extends StatelessWidget {
  final Key fieldKey;
  final String label;
  final bool textAllowed;
  final bool dismissKeyboard;
  final String? hintText;
  final TextEditingController controller;
  final void Function(String?)? onSubmitted;
  final void Function(String?)? onChanged;

  const AddRecipeOutlinedTextField({
    required this.fieldKey,
    required this.label,
    this.textAllowed = true,
    this.dismissKeyboard = true,
    required this.controller,
    this.hintText,
    this.onSubmitted,
    this.onChanged,
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
          controller: controller,
          textInputAction: dismissKeyboard
              ? TextInputAction.next
              : TextInputAction.unspecified,
          textCapitalization: TextCapitalization.sentences,
          keyboardType: textAllowed ? null : TextInputType.number,
          inputFormatters:
              textAllowed ? null : [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: colorFloralWhite),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: colorFloralWhite),
              ),
              hintText: hintText ?? label,
              labelText: label,
              labelStyle: const TextStyle(color: Colors.black)),
          onSubmitted: onSubmitted,
          onChanged: onChanged,
        )
      ],
    );
  }
}
