import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RecipeOutlinedTextField extends StatelessWidget {
  final Key fieldKey;
  final String label;
  final bool textAllowed;
  final TextInputAction inputAction;
  final bool autoFocus;
  final String? hintText;
  final TextEditingController controller;
  final void Function(String?)? onSubmitted;
  final void Function(String?)? onChanged;
  final FocusNode? focusNode;
  final int? height;

  const RecipeOutlinedTextField({
    required this.fieldKey,
    required this.label,
    this.autoFocus = false,
    this.textAllowed = true,
    this.inputAction = TextInputAction.next,
    required this.controller,
    this.hintText,
    this.onSubmitted,
    this.onChanged,
    this.focusNode,
    this.height,
  }) : super(key: fieldKey);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        SizedBox(
          height: MediaQuery.of(context).size.height * .025,
        ),
        TextField(
          autofocus: autoFocus,
          focusNode: focusNode,
          controller: controller,
          maxLines: height ?? 1,
          minLines: 1,
          textInputAction: inputAction,
          textCapitalization: TextCapitalization.sentences,
          keyboardType: textAllowed ? null : TextInputType.number,
          inputFormatters:
              textAllowed ? null : [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).iconTheme.color!),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).iconTheme.color!),
              ),
              hintText: hintText ?? label,
              labelText: label,
              labelStyle: const TextStyle()),
          onSubmitted: onSubmitted,
          onChanged: onChanged,
        )
      ],
    );
  }
}
