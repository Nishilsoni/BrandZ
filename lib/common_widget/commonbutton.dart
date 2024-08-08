import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback? onPressed;
  final String buttonText;
  // final Function()? validateForm;
  final Color? buttonColor;
  final Color? textColor;

  const ButtonApp({
    Key? key,
    required this.width,
    required this.height,
    this.onPressed,
    required this.buttonText,
    // this.validateForm,
    this.buttonColor =
        const Color.fromARGB(255, 121, 85, 72), // default brown color
    this.textColor = Colors.white, // default white color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          // if (validateForm != null) {
          //   validateForm!();
          // }
          if (onPressed != null) {
            onPressed!();
          }
        },
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          backgroundColor: WidgetStateProperty.all(buttonColor),
        ),
        child: Text(
          buttonText,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}