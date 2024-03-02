import 'package:fl_score_bar/fl_score_bar.dart';
import 'package:flutter/material.dart';
import '../../../app_style/app_colors.dart';
import '../../../app_style/app_text_style.dart';


class ResultView extends StatelessWidget {
  final double score;
  final String quizDuration;
  final int attempts;
  final int wrongAttempts;
  final int correctAttempts;
  final bool isSaved;


  const ResultView(
      {Key? key,
        required this.score,
        required this.quizDuration,
        required this.attempts,
        required this.wrongAttempts,
        required this.correctAttempts,
        required this.isSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconScoreBar(
              scoreIcon: Icons.star_rounded,
              iconColor: Colors.yellow,
              score: score > 0 ? score * 5 / 100 : 0,
              maxScore: 5,
              readOnly: true,
            ),
            const SizedBox(height: 30),
            Text(
              'The score is ${score.toString()}%',
              style: finalScoreStyle
            ),
            const SizedBox(height: 30),
            if(quizDuration!='')Text(
                'Quiz duration is $quizDuration',
                style: attemptsStyle
            ),
            if(quizDuration!='')const SizedBox(height: 30),
            Text(
              'Questions: ${attempts.toString()}',
              style: attemptsStyle
            ),
            const SizedBox(height: 30),
            Text(
              'Wrong Answers: ${wrongAttempts.toString()}',
              style: attemptsStyle
            ),
            const SizedBox(height: 30),
            Text(
              'Correct Answers: ${correctAttempts.toString()}',
              style: attemptsStyle
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 0.3 * MediaQuery.of(context).size.width,
                height: 0.08 * MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(1, 3),
                      blurRadius: 0.7,
                      color: Colors.grey.withOpacity(0.8),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.check,
                  color: primaryColor,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}