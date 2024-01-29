import 'package:flutter/material.dart';
import 'package:flutter_adv_basics/buttons/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    // sizedBox is another solution instead of using the Center widget
    return SizedBox(
      width: double.infinity, // special value to use as much space as possible
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'The question...',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 30),
          AnswerButton(onTap: () {}, answerText: 'Answer 1'),
          AnswerButton(onTap: () {}, answerText: 'Answer 2'),
          AnswerButton(onTap: () {}, answerText: 'Answer 3'),
        ],
      ),
    );
  }
}
