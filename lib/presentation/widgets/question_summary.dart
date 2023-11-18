import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/presentation/const.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 470,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((e) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 17,
                  backgroundColor: e['user_answer'] == e['correct_answer']
                      ? const Color.fromARGB(255, 68, 152, 222)
                      : const Color.fromARGB(255, 202, 57, 228),
                  child: Text(
                    ((e['question_index'] as int) + 1).toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e['question'] as String,
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: whiteColor,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        e['user_answer'] as String,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 202, 57, 228),
                        ),
                      ),
                      Text(
                        e['correct_answer'] as String,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 68, 152, 222)),
                      )
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
