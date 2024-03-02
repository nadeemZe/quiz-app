import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/app/quiz/quiz_model_view/quiz_events.dart';
import 'package:quiz_app/app/quiz/quiz_model_view/quiz_states.dart';
import '../quiz_model/quiz_model.dart';



class QuizBloc extends Bloc<QuizEvents, QuizStates> {

  QuizModel quizModel;

  QuizBloc(this.quizModel) : super(QuestionLoadedState( 0, 0, 0, 0, quizModel.quizList[0].question, quizModel.quizList[0].answerOptions)) {

    int currentCorrectAttempts = 0;
    int currentIndex = 0;
    int currentAttempts = 0;
    int currentWrongAttempts = 0;

    double getScore() {
        double score=(currentCorrectAttempts * 100) / quizModel.quizList.length;
        return double.parse(score.toStringAsFixed(2));
    }

    bool isCorrect(int i, int selectedOption) {
      if (quizModel.quizList[i].answerOptions[selectedOption] ==
          quizModel.quizList[i].correctAnswer) return true;
      return false;
    }

    on<AnswerSubmitted>((event, emit) async {
      if (event.selectedIndex != -1 && isCorrect(currentIndex, event.selectedIndex)) {
        ++currentCorrectAttempts;
      }
      currentAttempts = currentIndex + 1;
      currentWrongAttempts = currentAttempts - currentCorrectAttempts;
      double score = getScore();
      ++currentIndex;
      QuizStates answerSubmittedState = AnswerSubmittedState(
          currentIndex,
          currentAttempts,
          currentWrongAttempts,
          currentCorrectAttempts,
          score,
      );
      emit(answerSubmittedState);
    });

    on<AnswerSelected>((event, emit) async {
      if (event.selectedIndex != -1 && isCorrect(currentIndex, event.selectedIndex)) {
        ++currentCorrectAttempts;
      }
      currentAttempts = currentIndex + 1;
      currentWrongAttempts = currentAttempts - currentCorrectAttempts;
      ++currentIndex;
      QuizStates questionLoadedState = QuestionLoadedState(
        currentIndex,
        currentAttempts,
        currentWrongAttempts,
        currentCorrectAttempts,
        quizModel.quizList[currentIndex].question,
        quizModel.quizList[currentIndex].answerOptions,
      );
      emit(questionLoadedState);
    });

  }

}