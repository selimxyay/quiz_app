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
    // when user clicked to an answer
      // execute the onSelectedAnswers function
        // give selected answer by the user as a parameter to the onSelectedAnswers function
    widget.onSelectedAnswers(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // currentQuestion variable is equal to the first question, the first QuizModel widget
    final currentQuestion = questions[currentQuestionIndex];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // quiz questions will be displayed here
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
            // quiz answer buttons will be displayed here
            ...currentQuestion.shuffleTheAnswers().map( (answer) {
              return AnswerButton(
                  answerText: answer,
                  // onTap does not accept any parameter
                  // this is why it's wrapped with another anonymous function                
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
