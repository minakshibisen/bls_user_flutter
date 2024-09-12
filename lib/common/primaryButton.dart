import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  String text;
  Color color;
  Color textColor;
  Color borderColor;
  VoidCallback onPressed;
  BuildContext context;

  PrimaryButton({
    super.key,
    required this.borderColor,
    required this.onPressed,
    required this.context,
    this.text = "",
    this.color = Colors.red,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 10,
          backgroundColor: color,
          side: BorderSide(color: borderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
          ),
          minimumSize: const Size(300, 65),
        ),
        onPressed: () {
          // Action when the button is pressed
        },
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
