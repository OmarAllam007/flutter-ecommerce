import 'package:flutter/material.dart';
import 'package:shopapp/views/widgets/custom_text.dart';

class CustomFormField extends StatelessWidget {
  final String text;
  final String hintText;
  final FormFieldSetter<String> onSave;
  final FormFieldValidator<String> validator;

  const CustomFormField({
    super.key,
    required this.text,
    required this.hintText,
    required this.onSave,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text,
          fontSize: 14,
          color: Colors.grey.shade900,
        ),
        TextFormField(
          onSaved: onSave,
          validator: validator,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              fillColor: Colors.white),
        )
      ],
    );
  }
}
