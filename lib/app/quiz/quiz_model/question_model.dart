

class QuestionModel {
  final String question;
  final List<String> answerOptions;
  final String correctAnswer;

  QuestionModel({
    required this.question,
    required this.answerOptions,
    required this.correctAnswer,
  });
}