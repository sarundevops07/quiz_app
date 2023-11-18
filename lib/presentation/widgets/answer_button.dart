import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answer, required this.onTap});
  final String answer;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          backgroundColor:
              const MaterialStatePropertyAll(Color.fromARGB(255, 32, 12, 82))),
      onPressed: onTap,
      child: Text(answer, textAlign: TextAlign.center),
    );
  }
}
