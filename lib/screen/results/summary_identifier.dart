import 'package:flutter/material.dart';

class SummaryIdentifier extends StatelessWidget {
  const SummaryIdentifier(
    this.questionIndex,
    this.isCorrect, {
    super.key,
  });

  final int questionIndex;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: isCorrect
          ? const Color.fromARGB(255, 150, 198, 241)
          : const Color.fromARGB(255, 249, 133, 241),
      child: Center(
        child: Text(
          (questionIndex + 1).toString(),
          style: const TextStyle(
            color: Color.fromARGB(255, 22, 2, 56),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
