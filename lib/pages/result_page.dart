import 'package:flutter/material.dart';
import 'package:quiz_app/components/result/summary_list.dart';
import 'package:quiz_app/data/quiz_data.dart';

// ignore: must_be_immutable
class ResultsPage extends StatelessWidget {
  ResultsPage(
      {super.key,
      required this.selectedAnswersOfUsers,
      required this.resetQuiz});

  List<String> selectedAnswersOfUsers;
  void Function() resetQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswersOfUsers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].quizQuestions,
        "user_answer": selectedAnswersOfUsers[i],
        "correct_answer": questions[i].quizAnswers[0],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numberOfTotalQuestions = questions.length;
    final numberOfCorrectQuestions = summaryData
        .where((data) => data["user_answer"] == data["correct_answer"])
        .length;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "You answered $numberOfCorrectQuestions out of $numberOfTotalQuestions questions correctly!",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(218, 255, 255, 255),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 45),
            SummaryList(onGetSummaryData: getSummaryData()),
            const SizedBox(height: 45),
            TextButton.icon(
              onPressed: resetQuiz,
              label: const Text(
                "Restart Quiz",
                style: TextStyle(color: Colors.white),
              ),
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
