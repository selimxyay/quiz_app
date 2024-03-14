class QuizModel {
  // positional parameters are used instead of named parameters
    // because the order of parameters are important
      // first, question should be displayed
        // then, list of answers should be displayed
  const QuizModel(this.quizQuestions, this.quizAnswers);

  final String quizQuestions;
  final List<String> quizAnswers;

  // map method is used in QuizPage widget
  // and map method changes the original array
  // so another copy of quizAnswers must be created
  // List.of() method is used to create a copy of the List
  // shuffle() method is used to shuffle the location of quizAnswers inside copied List
  // note => quizAnswers is a List of strings, and each string is a possible answer
  List<String> shuffleTheAnswers() {
    final shuffledList = List.of(quizAnswers);
    shuffledList.shuffle();
    return shuffledList;
  }
}