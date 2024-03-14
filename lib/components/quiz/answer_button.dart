import 'package:flutter/material.dart';

// this AnswerButton widget is basically a button model for each answer

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  final String answerText;
  final void Function() onTap;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      // this padding is for the space between each answer button
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 33, 1, 95),
          foregroundColor: Colors.white, 
          // and this padding is for the space between button borders and its content
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        ),
        // the text inside each answer button
        child: Text(
          answerText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
