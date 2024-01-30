import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adv_basics/data/questions.dart';
import 'package:flutter_adv_basics/screen/results/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.onResetQuiz,
    required this.chosenAnswers,
  });

  final void Function() onResetQuiz;
  final List<String> chosenAnswers;

  // dart feature for get methods instead of getSummaryData()
  List<Map<String, Object>> get summaryData {
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
    final numTotalQuestions = questions.length;
    final numCorrectQuestions =
        summaryData.where((data) => data['is_correct'] as bool).length;

    if (kDebugMode) {
      print('Chosen Answers: $chosenAnswers');
      print('Summary: $summaryData');
    }
    return SizedBox(
      width: double.infinity, // special value to use as much space as possible
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 194, 182, 224),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 60),
            TextButton.icon(
              onPressed: onResetQuiz,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
