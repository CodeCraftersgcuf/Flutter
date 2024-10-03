import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300, // Adjusted the height to be a bit larger
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Question index with padding
                    Container(
                      margin: const EdgeInsets.only(right: 16),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.blue,
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    // Question, user answer, and correct answer
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // The Question
                          Text(
                            data['question'] as String,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          // User's Answer
                          Text(
                            'Your answer: ${data['user_answer']}',
                            style: TextStyle(
                              color: Colors.red[400],
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          // Correct Answer
                          Text(
                            'Correct answer: ${data['correct_answer']}',
                            style: TextStyle(
                              color: Colors.green[400],
                              fontSize: 14,
                            ),
                          ),
                          const Divider(
                            color: Color.fromARGB(255, 224, 218, 218),
                            height: 20,
                            thickness: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
