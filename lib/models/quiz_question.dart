// class to store data about quiz questions and answers
class QuizQuestion {
  // constructor
  const QuizQuestion(this.text, this.answers);

  // properties
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    // make a copy of answers list to the memory
    final List<String> shuffledAnswers = List.of(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
