import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.blue
              ]
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                  'lib/assets/images/quiz-logo.png',
                width: 300,
                color: Colors.white.withOpacity(.65),
              ),
              const SizedBox(height: 50,),
              const Text(
                  'Learn Flutter',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
                ),
              ),
              const SizedBox(height: 50,),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                onPressed: (){
                  Navigator.pushReplacement(
                      context,
                    MaterialPageRoute(builder: (context) =>  QuestionsScreen()),
                  );
                },
                label: const Text('Start Quiz'),
                icon: const Icon(Icons.arrow_right_alt_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
