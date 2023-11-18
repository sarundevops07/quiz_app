import 'package:flutter/material.dart';
import 'package:quiz_app/model/questions_answer.dart';
import 'package:quiz_app/presentation/const.dart';
import 'package:quiz_app/presentation/question_screen.dart';
import 'package:quiz_app/presentation/result_screen.dart';
import 'package:quiz_app/presentation/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen: switchScreen);
  }

  void chooseAnswer(String answers) {
    selectedAnswers.add(answers);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(
          onRestart: restartQuiz,
          choosenAnswers: selectedAnswers,
        );
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(
        onSelecteAnswer: chooseAnswer,
      );
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = QuestionScreen(onSelecteAnswer: chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(backgroundColor: voiletColor),
      ),
      color: voiletColor,
      home: Scaffold(body: activeScreen),
    );
  }
}
