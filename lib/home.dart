import 'package:flutter/material.dart';
import 'logo.dart';
import 'package:google_fonts/google_fonts.dart';

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
        Text(
          'Learn flutter the fun way!',
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 166, 215, 246),
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
