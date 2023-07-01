import 'package:flutter/material.dart';
import 'logo.dart';

class Home extends StatelessWidget {
  const Home(this.logoUrl, this.buttonText, this.startQuiz, {super.key});

  final String logoUrl;
  final String buttonText;
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Logo(logoUrl),
        const SizedBox(height: 50),
        const Text(
          'Learn flutter the fun way',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 50),
        ElevatedButton.icon(
          onPressed: startQuiz,
          icon: const Icon(Icons.arrow_right_alt),
          label: Text(buttonText),
        ),
      ],
    );
  }
}
