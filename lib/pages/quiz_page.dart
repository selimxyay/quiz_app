import 'package:flutter/material.dart';
import 'package:quiz_app/components/quiz/answer_button.dart';
import 'package:quiz_app/data/quiz_data.dart';

// ignore: must_be_immutable
class QuizPage extends StatefulWidget {
  QuizPage({super.key, required this.onSelectedAnswers});

  void Function(String answer) onSelectedAnswers;

  @override
  State<QuizPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuizPage> {
  var currentQuestionIndex = 0;

  void userClickedAnAnswer(String selectedAnswer) {
    widget.onSelectedAnswers(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // quiz questions
            Text(
              currentQuestion.quizQuestions,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // quiz answer buttons
            ...currentQuestion.shuffleTheAnswers().map((answer) {
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    userClickedAnAnswer(answer);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
