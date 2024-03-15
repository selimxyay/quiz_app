class QuizModel {
  const QuizModel(this.quizQuestions, this.quizAnswers);

  final String quizQuestions;
  final List<String> quizAnswers;

  List<String> shuffleTheAnswers() {
    final shuffledList = List.of(quizAnswers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
