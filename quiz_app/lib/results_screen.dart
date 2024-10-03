import 'package:flutter/material.dart';
import 'package:first_app/data/questions.dart';
import 'package:first_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chooseAnswers,
    required this.onRestart, // Add the restart function
  });

  final List<String> chooseAnswers;
  final VoidCallback onRestart; // Callback to restart the quiz

  // Calculate the summary data with questions, user answers, and correct answers
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chooseAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0], // assuming the first answer is correct
        'user_answer': chooseAnswers[i],
      });
    }
    return summary;
  }

  // Calculate how many answers were correct
  int getCorrectAnswersCount() {
    int correctCount = 0;
    for (var i = 0; i < chooseAnswers.length; i++) {
      if (chooseAnswers[i] == questions[i].answers[0]) {
        correctCount++;
      }
    }
    return correctCount;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = getCorrectAnswersCount();

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              // Dynamic message based on the correct answers
              numCorrectQuestions == numTotalQuestions
                  ? "All answers are correct!"
                  : "You got $numCorrectQuestions out of $numTotalQuestions correct!",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: onRestart, // Call the restart function here
              child: const Text(
                "Restart Quiz",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 28, 177, 200),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
