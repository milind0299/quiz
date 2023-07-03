import 'package:flutter/material.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/home.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];

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
      activeScreen = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    });
  }

  void homeScreen() {
    setState(() {
      activeScreen = Home(
        'assets/images/quiz-logo.png',
        'Start Quiz',
        switchScreen,
      );
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(
          chosenAnswers: selectedAnswers,
          changeScreen: switchScreen,
          changeScreenHome: homeScreen,
        );
        selectedAnswers = [];
      });
    }
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
          child: activeScreen,
        ),
      ),
    );
  }
}
