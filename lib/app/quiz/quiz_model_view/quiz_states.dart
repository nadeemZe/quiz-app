class QuizStates {

  final int currentIndex;
  final int currentAttempts;
  final int currentWrongAttempts;
  final int currentCorrectAttempts;

  const QuizStates( this.currentIndex, this.currentAttempts, this.currentWrongAttempts, this.currentCorrectAttempts);

}


class QuestionLoadedState extends QuizStates {

  final dynamic currentQuestion;
  final dynamic options;

  const QuestionLoadedState( int currentIndex, int currentAttempts, int currentWrongAttempts, int currentCorrectAttempts, this.currentQuestion, this.options) : super( currentIndex, currentAttempts, currentWrongAttempts, currentCorrectAttempts);

}

class AnswerSubmittedState extends QuizStates {
  final double score;

  const AnswerSubmittedState( int currentIndex, int currentAttempts, int currentWrongAttempts, int currentCorrectAttempts, this.score) : super( currentIndex, currentAttempts, currentWrongAttempts, currentCorrectAttempts);
}