import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomSocialButton extends StatelessWidget {
  final String text;
  final String imageName;
  final VoidCallback onPressed;

  const CustomSocialButton(
      {super.key, required this.text, required this.imageName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey.shade50),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              imageName,
              width: 30,
              height: 70,
            ),
            SizedBox(
              width: 50,
            ),
            CustomText(text: text)
          ],
        ),
      ),
    );
  }
}
