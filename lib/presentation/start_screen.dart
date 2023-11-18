import 'package:flutter/material.dart';
import 'package:quiz_app/presentation/const.dart';

class StartScreen extends StatelessWidget {
  StartScreen({super.key, required this.switchScreen});

  final String logo = 'assets/images/quiz-logo.png';
  void Function() switchScreen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            logo,
            height: 300,
          ),
          spaceHeight70,
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(color: whiteColor, fontSize: 25),
          ),
          spaceHeight25,
          ElevatedButton(
            onPressed: switchScreen,
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(voiletColor),
              shape: MaterialStatePropertyAll(
                BeveledRectangleBorder(),
              ),
            ),
            child: const Text(
              'Start Quiz',
              style: TextStyle(color: whiteColor),
            ),
          )
        ],
      )),
    );
  }
}
