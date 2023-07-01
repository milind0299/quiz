import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo(this.logoUrl, {super.key});

  final String logoUrl;

  @override
  Widget build(context) {
    return Center(
      child: Image.asset(
        logoUrl,
        width: 400,
        color: const Color.fromARGB(150, 255, 255, 255),
      ),
    );
  }
}
