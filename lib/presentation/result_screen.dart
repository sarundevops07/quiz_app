import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/model/questions_answer.dart';
import 'package:quiz_app/presentation/const.dart';

import 'package:quiz_app/presentation/widgets/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choosenAnswers, required this.onRestart});

  final List<String> choosenAnswers;
  final Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (int i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final correctQuestons = summaryData
        .where(
          (element) => element['user_answer'] == element['correct_answer'],
        )
        .length;
    return Center(
      child: Container(
        margin: const EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You Answers $correctQuestons out $totalQuestions questions corrrectly!',
              style: GoogleFonts.roboto(fontSize: 20, color: whiteColor),
              textAlign: TextAlign.center,
            ),
            spaceHeight40,
            QuestionSummary(summaryData),
            spaceHeight25,
            ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              onPressed: onRestart,
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(voiletColor),
                shape: MaterialStatePropertyAll(
                  BeveledRectangleBorder(),
                ),
              ),
              label: const Text(
                'Restart Quiz!',
                style: TextStyle(color: whiteColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
