import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/app/quiz/quiz_model/quiz_model.dart';
import 'package:quiz_app/app/quiz/quiz_model_view/quiz_events.dart';
import 'package:quiz_app/app/quiz/quiz_view/timer_widget.dart';
import 'package:quiz_app/app/result/result_view/result_view.dart';
import '../../../app_style/app_colors.dart';
import '../../../app_style/app_text_style.dart';
import '../quiz_model_view/quiz_bloc.dart';
import '../quiz_model_view/quiz_states.dart';
import 'option_widget.dart';

class QuizView extends StatefulWidget {
  final QuizModel quizModel;
  final bool timedQuiz;

  const QuizView({Key? key, required this.quizModel,required this.timedQuiz}) : super(key: key);

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {

  int selectedOption = -1;

  List<Widget> buildOptions(List<String> options) {

    List<Widget> optionsList = [];
    for (int j = 0; j <options.length ; j++) {
      optionsList.add(OptionWidget(
        option: options[j],
        optionColor: (selectedOption==j)?Colors.grey:Colors.white,
        onTap: () async {
          setState(() {
            selectedOption = j;
          });
        },
      ));
    }
    return optionsList;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => QuizBloc(widget.quizModel),
        child: BlocListener<QuizBloc, QuizStates>(
          listener: (context, state) {
            if (state is AnswerSubmittedState) {
              _navigateToResultScreen(context, state);
            }
          },
          child: BlocBuilder<QuizBloc, QuizStates>(
            buildWhen: (previous, current) => true,
            builder: (BuildContext context, state) {
              if (state is QuestionLoadedState) {
                return Scaffold(
                  backgroundColor: secondColor,
                  body: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.timedQuiz) const SizedBox(height:51,child: TimerWidget()),
                            Text(
                                '${(state.currentIndex + 1).toString()} of ${widget.quizModel.quizList.length}',
                                style: currentIndexStyle
                            ),
                            const SizedBox(height: 10,),
                            Text(
                                state.currentQuestion,
                                style: currentQuestionStyle
                            ),
                          ],
                        ),
                        ...buildOptions(state.options),
                        Align(
                          alignment: Alignment.bottomRight,
                           child: ElevatedButton(
                              onPressed: () {
                                if (state.currentIndex < widget.quizModel.quizList.length-1) {
                                  int selectedIndex = selectedOption;
                                  selectedOption = -1;
                                  BlocProvider.of<QuizBloc>(context).add(AnswerSelected(selectedIndex));
                                } else {
                                  BlocProvider.of<QuizBloc>(context).add(AnswerSubmitted(selectedOption));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                minimumSize: const Size(100, 40), //////// HERE
                              ),
                              child: const Text('Next',style: TextStyle(color: Colors.white),),
                            ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Container(color:secondColor,child: Center(child: Text('Loading...',style: currentQuestionStyle,)));
            },
          ),
        )
    );
  }

  void _navigateToResultScreen(context, AnswerSubmittedState state) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultView(
          score: state.score,
          quizDuration:(widget.timedQuiz)?'${TimerWidget.minutes}:${TimerWidget.seconds}':'',
          attempts: state.currentAttempts,
          wrongAttempts: state.currentWrongAttempts,
          correctAttempts: state.currentCorrectAttempts,
          isSaved: false,
        ),
      ),
    );
  }
}