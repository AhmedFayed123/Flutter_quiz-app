import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answerText, required this.onPressed,});
  final String answerText;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
              answerText,
            textAlign: TextAlign.center,
          ),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple,
          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40)
          )
        ),
      ),
    );
  }
}
