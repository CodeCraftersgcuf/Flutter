import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  dosomething() {
    print("CLicked me");
  }

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assests/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Learn Flutter in the Fun way!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          OutlinedButton.icon(
            onPressed: dosomething,
            label: const Text(
              'Start Quiz',
              style: TextStyle(color: Colors.white, fontSize: 23),
            ),
            icon: const Icon(Icons.arrow_right_alt, color: Colors.white,),
          )
        ],
      ),
    );
  }
}
