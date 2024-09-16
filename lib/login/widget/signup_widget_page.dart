import 'package:flutter/material.dart';

class AuthenticationWidget extends StatelessWidget {
  final String? image;
  final Color buttonColor;
  final Color textColor;
  final String labelText;
  final Function()? onPressed;

  const AuthenticationWidget(
      {super.key,
      this.image,
      this.onPressed,
      required this.buttonColor,
      required this.textColor,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null && image!.isNotEmpty)
              CircleAvatar(
                foregroundImage: AssetImage(image!),
                minRadius: 11,
              ),
            const SizedBox(width: 8),
            Text(
              labelText,
              style: TextStyle(color: textColor, fontSize: 17),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
