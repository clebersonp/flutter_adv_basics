import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adv_basics/data/questions.dart';
import 'package:flutter_adv_basics/enumeration/screens.dart';
import 'package:flutter_adv_basics/screen/home/start_screen.dart';
import 'package:flutter_adv_basics/screen/questions/questions_screen.dart';
import 'package:flutter_adv_basics/screen/results/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // using enum in dart to check with ternary operator later
  var activeScreen = Screens.startScreen;

  // this list will be used for storing the user's answers
  List<String> selectedAnswers = [];

  // this approach to switch screens is one of 'rendering content conditionally'
  void switchScreen() {
    setState(() => activeScreen = Screens.questionsScreen);
  }

  // this method is responsible for checking if the answers already exists in
  // the list before added it
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (kDebugMode) {
      print('Answers: $selectedAnswers');
    }

    // if the length of both lists is equals, so this is time to change the
    // screen
    if (selectedAnswers.length == questions.length) {
      // force to rebuild the widget (perform the build method)
      setState(() {
        activeScreen = Screens.resultsScreen;
      });
    }
  }

  // reset the quiz
  void resetQuiz() {
    setState(() {
      // erase the list of selected answers
      selectedAnswers = [];
      // change the screen to rebuild it
      activeScreen = Screens.startScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    // created a local variable to use it as a conditional to change the
    // screen widget
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == Screens.questionsScreen) {
      // changed the constructor, passing a function as argument
      screenWidget = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    }
    if (activeScreen == Screens.resultsScreen) {
      screenWidget = ResultsScreen(
        onResetQuiz: resetQuiz,
        chosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
