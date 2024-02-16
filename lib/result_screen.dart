import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';
import 'data/questions.dart';
class ResultScreen extends StatefulWidget {
  const ResultScreen(this.selectedAnswer,{super.key});

  final List<String> selectedAnswer;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<Map<String, Object>> getSummaryData(){
    final List<Map<String,Object>> summary = [];
    for(var i=0;i<widget.selectedAnswer.length;i++){
      summary.add({
        'Question Index':i,
        'Question': questions[i].questions,
        'Correct Answer':questions[i].answers[0],
        'Your Answer':widget.selectedAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData=getSummaryData();
    var numOfCorrectAnswer=0;

    for(int i = 0;i<summaryData.length;i++){
      if(summaryData[i]['Your Answer']== summaryData[i]['Correct Answer']){
        numOfCorrectAnswer++;
      }
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.red
                ]
            )
        ),
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.all(30),
                child: Text(
                    'You Answered ${numOfCorrectAnswer} out of ${questions.length} questions correctly',
                  style: const TextStyle(color: Colors.yellowAccent,fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              ...summaryData.map((e) => Column(
                children: [
                  Row(
                    children:[
                      CircleAvatar(
                          backgroundColor: e['Your Answer']== e['Correct Answer']?Colors.green:Colors.red,
                          radius: 16,
                          child: Text(
                              ((e['Question Index'] as int) +1 ).toString()),
                        ),
                      SizedBox(width: 15,),
                       Expanded(
                         child: SingleChildScrollView(
                           child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  e['Question'].toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Text(
                                  e['Your Answer'].toString(),
                                style: const TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Text(
                                  e['Correct Answer'].toString(),
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 20,),
                ],
              )),
              ElevatedButton.icon(
                  onPressed: (){
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context)=>const HomeScreen()),
                    );
                  },
                  icon: const Icon(Icons.restart_alt),
                  label: const Text('Restart'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
