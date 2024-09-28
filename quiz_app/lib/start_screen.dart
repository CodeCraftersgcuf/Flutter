import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  // Constructor now requires a valid function
  const StartScreen(this.startQuiz, {super.key});

  // Non-null callback to start the quiz
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assests/images/quiz-logo.png', // Ensure the asset path is correct
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            'Learn Flutter in the Fun way!',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          OutlinedButton.icon(
            onPressed:
                startQuiz, // Using the valid function passed from Quiz widget
            label: const Text(
              'Start Quiz',
              style: TextStyle(color: Colors.white, fontSize: 23),
            ),
            icon: const Icon(Icons.arrow_right_alt, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
