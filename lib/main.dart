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
  // the string of "intro_page" is representing the IntroPage() widget
  // the string of "questions_page" is representing the QuizPage() widget
  var stringOfCurrentPage = "intro_page";

  void switchCurrentScreen() {
    setState(() {
      stringOfCurrentPage = "quiz_page";
    });
  }

  // selectedAnswers variable will store the answers that selected by the users

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
    // currentPage variable will store widgets, and each widget is for different pages
    Widget currentPage = IntroPage(switchCurrentScreen);

    if (stringOfCurrentPage == 'quiz_page') {
      // when user selected an answer
        // getSelectedAnswer will execute
      currentPage = QuizPage(onSelectedAnswers: getSelectedAnswers);
    } else if (stringOfCurrentPage == 'results_page') {
      currentPage = ResultsPage(selectedAnswersOfUsers: selectedAnswers, resetQuiz: resetQuiz,);
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple,
        body: currentPage,
      ),
    );
  }
}
