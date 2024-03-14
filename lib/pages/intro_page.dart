import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage(this.switchCurrentScreen, {super.key});

  final void Function() switchCurrentScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'lib/assets/images/quiz-logo.png',
              height: 300,
              color: const Color.fromARGB(177, 255, 255, 255),
            ),
            const SizedBox(height: 70),
            const Text(
              "Learn Flutter the fun way!",
              style: TextStyle(
                  color: Color.fromARGB(177, 255, 255, 255),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 60),
            /* Start Quiz Button */
            OutlinedButton(
              onPressed: switchCurrentScreen,
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                      color: Color.fromARGB(177, 255, 255, 255))),
              child: const Text(
                "Start Quiz",
                style: TextStyle(
                  color: Color.fromARGB(196, 255, 255, 255),
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
