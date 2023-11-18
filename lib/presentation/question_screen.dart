import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/model/questions_answer.dart';
import 'package:quiz_app/presentation/const.dart';
import 'package:quiz_app/presentation/widgets/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelecteAnswer});
  final Function(String answers) onSelecteAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  void answerQuestion(String answer) {
    widget.onSelecteAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final questionAnswers = questions[currentQuestionIndex];
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 27),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questionAnswers.question,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(color: whiteColor, fontSize: 21),
            ),
            spaceHeight40,
            ...questionAnswers.getShuffledAnswers().map((e) => AnswerButton(
                  answer: e,
                  onTap: () => answerQuestion(e),
                ))
          ],
        ),
      ),
    );
  }
}
