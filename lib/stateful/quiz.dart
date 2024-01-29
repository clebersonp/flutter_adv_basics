import 'package:flutter/material.dart';
import 'package:flutter_adv_basics/enumeration/screens.dart';
import 'package:flutter_adv_basics/screen/home/start_screen.dart';
import 'package:flutter_adv_basics/screen/questions/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // using enum in dart to check with ternary operator later
  var activeScreen = Screens.startScreen;

  // this approach to switch screens is one of 'rendering content conditionally'
  void switchScreen() {
    setState(() => activeScreen = Screens.questionsScreen);
  }

  @override
  Widget build(BuildContext context) {
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
          child: activeScreen == Screens.startScreen
              ? StartScreen(switchScreen)
              : const QuestionsScreen(),
        ),
      ),
    );
  }
}
