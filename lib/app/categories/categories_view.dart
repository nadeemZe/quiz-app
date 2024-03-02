import 'package:flutter/material.dart';
import 'package:quiz_app/app/quiz/quiz_model/quiz_model.dart';
import 'package:quiz_app/app/quiz/quiz_view/quiz_view.dart';
import '../../app_style/app_colors.dart';
import '../../app_style/app_text_style.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Categories',
                style: categoryStyle
              ),
              const SizedBox(height: 25),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QuizView(quizModel:quizModel1,timedQuiz: false,)));
                },
                child: Container(
                  width: 250,
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(31),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'Food and Culture',
                    style: categoryItemStyle
                  ),
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QuizView(quizModel:quizModel2,timedQuiz: true,)));
                },
                child: Container(
                  width: 250,
                  margin: const EdgeInsets.only(top: 20),
                  padding:const EdgeInsets.all(31),
                  decoration: BoxDecoration(
                    color: secondColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'General Info   ⌚️',
                    style: categoryItemStyle
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
