import 'package:first_app/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // activeScreen is initialized with StartScreen, so it's not null
  var activeScreen = 'start-screen'; // temporary empty function

  // Function to switch the screen
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidget = activeScreen == 'start-screen'
        ? StartScreen(switchScreen)
        : const QuestionsScreen();

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 58, 23, 119),
                Color.fromARGB(255, 52, 6, 57),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // Use the activeScreen without a null check since we initialized it
          child: screenWidget,
        ),
      ),
    );
  }
}
