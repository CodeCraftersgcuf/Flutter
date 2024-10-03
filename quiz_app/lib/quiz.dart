import 'package:first_app/data/questions.dart';
import 'package:first_app/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_app/start_screen.dart';
import 'package:first_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  String activeScreen = 'start-screen'; // Temporary initial screen

  // Function to switch the screen
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswers(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  //Restart Quiz
  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget;

    // Determine which screen to display based on activeScreen
    switch (activeScreen) {
      case 'start-screen':
        screenWidget = StartScreen(switchScreen);
        break;
      case 'questions-screen':
        screenWidget = QuestionsScreen(
          onSelectAnswer: chooseAnswers,
        );
        break;
      case 'results-screen':
        screenWidget = ResultsScreen(
            chooseAnswers: selectedAnswers, onRestart: restartQuiz);
        break;
      default:
        screenWidget = StartScreen(switchScreen);
    }

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
          child: screenWidget,
        ),
      ),
    );
  }
}
