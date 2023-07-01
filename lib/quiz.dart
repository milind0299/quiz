import 'package:flutter/material.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/home.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = Home(
      'assets/images/quiz-logo.png',
      'Start Quiz',
      switchScreen,
    );
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 65, 147, 240),
                Color.fromARGB(255, 8, 28, 51),
              ],
            ),
          ),
          child: Center(child: activeScreen),
        ),
      ),
    );
  }
}
