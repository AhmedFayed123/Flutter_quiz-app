class QuizQuestions{

  final String questions;
  final List<String> answers;

  QuizQuestions(this.questions, this.answers);

  List<String> getShuffledAnswers(){
    final shuffledList=List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}