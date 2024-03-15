import 'package:flutter/material.dart';
import 'package:quiz_app/pages/quiz_page.dart';
import 'package:quiz_app/pages/intro_page.dart';
import 'package:quiz_app/pages/result_page.dart';
import 'package:quiz_app/data/quiz_data.dart';

void main() {
  runApp(const Quiz());
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var stringOfCurrentPage = "intro_page";

  void switchCurrentScreen() {
    setState(() {
      stringOfCurrentPage = "quiz_page";
    });
  }

  List<String> selectedAnswers = [];

  void getSelectedAnswers(String selectedAnswer) {
    selectedAnswers.add(selectedAnswer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        stringOfCurrentPage = "results_page";
      });
    }
  }

  void resetQuiz() {
    setState(() {
      selectedAnswers.clear();
      stringOfCurrentPage = "quiz_page";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentPage = IntroPage(switchCurrentScreen);

    switch (stringOfCurrentPage) {
      case 'quiz_page':
        currentPage = QuizPage(onSelectedAnswers: getSelectedAnswers);
        break;

      case 'results_page':
        currentPage = ResultsPage(
            selectedAnswersOfUsers: selectedAnswers, resetQuiz: resetQuiz);
        break;
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple,
        body: currentPage,
      ),
    );
  }
}
