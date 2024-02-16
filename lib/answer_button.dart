import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answerText, required this.onPressed,});
  final String answerText;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: ElevatedButton(
          onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple,
          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40)
          )
        ),
          child: Text(
              answerText,
            textAlign: TextAlign.center,
          ),
      ),
    );
  }
}
