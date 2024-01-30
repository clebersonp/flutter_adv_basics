import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adv_basics/data/questions.dart';
import 'package:flutter_adv_basics/screen/results/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.onResetQuiz,
    required this.chosenAnswers,
  });

  final void Function() onResetQuiz;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
          'is_correct': questions[i].answers[0] == chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Chosen Answers: $chosenAnswers');
      print('Summary: ${getSummaryData()}');
    }
    return SizedBox(
      width: double.infinity, // special value to use as much space as possible
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You answered X out of Y questions correctly!'),
            const SizedBox(height: 30),
            QuestionsSummary(getSummaryData()),
            const SizedBox(height: 30),
            TextButton(
              onPressed: onResetQuiz,
              child: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
