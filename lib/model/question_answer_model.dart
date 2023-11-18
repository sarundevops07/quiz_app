class QuestionAnswerModel {
  final String question;
  final List<String> answers;
  QuestionAnswerModel(
    this.question,
    this.answers,
  );
  List<String> getShuffledAnswers() {
    final suffledList = List.of(answers);
    suffledList.shuffle();
    return suffledList;
  }
}
