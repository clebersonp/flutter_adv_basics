import 'package:flutter/material.dart';
import 'package:flutter_adv_basics/buttons/answer_button.dart';
import 'package:flutter_adv_basics/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  // dart spread operator: ... (3 dots) in front of a List ou anything that
  // is Iterable
  @override
  Widget build(BuildContext context) {
    // using the dummy questions list
    final currentQuestion = questions[0];

    // sizedBox is another solution instead of using the Center widget
    return SizedBox(
      width: double.infinity, // special value to use as much space as possible
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            ...currentQuestion
                .getShuffledAnswers()
                .map((answer) => AnswerButton(onTap: () {}, answerText: answer))
          ],
        ),
      ),
    );
  }
}
