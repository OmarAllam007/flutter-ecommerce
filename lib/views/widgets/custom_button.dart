import 'package:flutter/material.dart';
import 'package:shopapp/views/widgets/custom_text.dart';

import '../../constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final  VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: CustomText(
        text: text,
        color: Colors.white,
        alignment: Alignment.center,
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.all(18),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
    );
  }
}
