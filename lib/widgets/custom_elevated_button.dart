import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText; // Add the button text as an input

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.buttonText, // Include buttonText in constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(241, 110, 0, 1.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      child: Text(buttonText), // Use buttonText as the button label
    );
  }
}
