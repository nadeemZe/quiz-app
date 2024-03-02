abstract class QuizEvents {}

class AnswerSelected extends QuizEvents {
  final int selectedIndex;
  AnswerSelected(this.selectedIndex);
}

class AnswerSubmitted extends QuizEvents {
  final int selectedIndex;
  AnswerSubmitted(this.selectedIndex);
}