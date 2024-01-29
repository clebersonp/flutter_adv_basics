import 'package:flutter/material.dart';
import 'package:flutter_adv_basics/screen/home/start_screen.dart';
import 'package:flutter_adv_basics/screen/questions/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // question mark means that activeScreen can be NULL
  Widget? activeScreen;

  // this initialize the state and it will be executed before the build method
  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    // pass the initialization to the super classes
    super.initState();
  }

  // this approach to switch screens is one of 'rendering content conditionally'
  void switchScreen() {
    setState(() => activeScreen = const QuestionsScreen());
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
          child: activeScreen,
        ),
      ),
    );
  }
}
