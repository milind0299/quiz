import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer(this.value, this.onTap, {super.key});

  final String value;
  final void Function() onTap;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      ),
      child: Text(
        value,
        textAlign: TextAlign.center,
      ),
    );
  }
}
