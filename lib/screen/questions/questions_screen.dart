import 'package:flutter/material.dart';
import 'package:flutter_adv_basics/buttons/answer_button.dart';
import 'package:flutter_adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectedAnswer,
  });

  // added new properties that store a pointer to a function that receives a
  // string as argument
  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  // managing the questions index
  var currentQuestionIndex = 0;

  // the variable currentQuestionIndex changed, therefore we need create a
  // StatefulWidget to manage it because the build method needs to be rerun
  // every click button
  void answerQuestion(String selectedAnswer) {
    // widget is a property of class State, which is possible to access data
    // from the super widget, QuestionScreen in this case
    widget.onSelectedAnswer(selectedAnswer);
    // call the setState method from State class to rebuild the widgets by
    // calling the build method
    setState(() {
      currentQuestionIndex++;
    });
  }

  // dart spread operator: ... (3 dots) in front of a List ou anything that
  // is Iterable
  @override
  Widget build(BuildContext context) {
    // using the dummy questions list
    final currentQuestion = questions[currentQuestionIndex];

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
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ...currentQuestion
                .getShuffledAnswers()
                .map((answer) => AnswerButton(
                      onTap: () {
                        // this does not call instantly, it will be called
                        // when the anonymous function( () {} ) is called.
                        // Therefore, it will be able to pass 'this' answer
                        // to the real function to store this answer
                        answerQuestion(answer);
                      },
                      answerText: answer,
                    ))
          ],
        ),
      ),
    );
  }
}
