import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key,
      required this.chosenAnswers,
      required this.changeScreen,
      required this.changeScreenHome});

  final List<String> chosenAnswers;
  final void Function() changeScreen;
  final void Function() changeScreenHome;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  int getCorrectAnswersCount() {
    final List<Map<String, Object>> summaryData = getSummaryData();
    var count = 0;
    for (var i = 0; i < summaryData.length; i++) {
      if (summaryData[i]['correct_answer'] == summaryData[i]['user_answer']) {
        count++;
      }
    }
    return count;
  }

  @override
  Widget build(context) {
    var correctAnswers = getCorrectAnswersCount();
    var total = chosenAnswers.length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have answered $correctAnswers out of $total questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 173, 202, 240),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(
              summaryData: getSummaryData(),
            ),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: changeScreen,
              icon: const Icon(Icons.restart_alt_rounded),
              label: Text(
                'Restart Quiz',
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 173, 202, 240),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton.icon(
              onPressed: changeScreenHome,
              icon: const Icon(Icons.home),
              label: Text(
                'Home',
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 173, 202, 240),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
