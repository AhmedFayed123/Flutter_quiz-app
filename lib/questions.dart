
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/result_screen.dart';
import 'data/questions.dart';

class QuestionsScreen extends StatefulWidget {
   const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
   var currentQuestionIndex=0;
   List<String> selectedAnswer = [];

   void chooseAnswer(String answer){
     selectedAnswer.add(answer);
     if(selectedAnswer.length==questions.length){
       setState(() {
         Navigator.pushReplacement(
           context,
           MaterialPageRoute(builder: (context) =>  ResultScreen(selectedAnswer)),
         );
       });
     }
   }
   void answerQuestion(String answer){
     chooseAnswer(answer);
     setState(() {
       currentQuestionIndex++;
     });
   }

  @override
  Widget build(BuildContext context) {
    final currentQuestion=questions[currentQuestionIndex];
    return  Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red,
              Colors.blue
            ]
          )
        ),
        child: Center(
          child: Column(
            mainAxisSize:MainAxisSize.min,
            children: [
              Text(currentQuestion.questions,
                style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30,),
              ...currentQuestion.getShuffledAnswers().map((e){
                return Container(
                  margin: const EdgeInsets.all(5),
                  child: AnswerButton(
                    answerText: e,
                    onPressed: ()=> answerQuestion(e),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
