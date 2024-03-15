import 'package:flutter/material.dart';

class SummaryList extends StatelessWidget {
  const SummaryList({
    super.key,
    required this.onGetSummaryData,
  });

  final List<Map<String, Object>> onGetSummaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: onGetSummaryData.map((data) {
              return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 22,
                      // Ternary Operator is used to display different colors based on a condition
                      backgroundColor:
                          data["user_answer"] == data["correct_answer"]
                              ? const Color.fromARGB(255, 60, 131, 118)
                              : const Color.fromARGB(255, 215, 80, 125),
                      child: Text(
                        ((data["question_index"] as int) + 1).toString(),
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              data["question"] as String,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              data["user_answer"] as String,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              data["correct_answer"] as String,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 70, 209, 72)),
                            ),
                            const SizedBox(height: 25),
                          ],
                        ),
                      ),
                    ),
                  ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
