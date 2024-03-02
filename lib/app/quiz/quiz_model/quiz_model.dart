

import 'package:quiz_app/app/quiz/quiz_model/question_model.dart';

class QuizModel{
 final List<QuestionModel> quizList;
 QuizModel({required this.quizList});

}
QuizModel  quizModel1=QuizModel(quizList: quiz1);
QuizModel  quizModel2=QuizModel(quizList: quiz2);

List<QuestionModel>quiz1=[
  QuestionModel(
      question: 'In what country was the Caesar salad invented?',
      answerOptions: ['The US','Poland','Mexico'],
      correctAnswer: 'Mexico',
  ),
  QuestionModel(
      question: 'In which Italian city was pizza first made?',
      answerOptions: ['Naples','Rome','Palermo'],
      correctAnswer: 'Naples',
  ),
  QuestionModel(
      question: 'What is the primary ingredient in hummus?',
      answerOptions: ['Black beans','Edemame beans','Chickpeas'],
      correctAnswer: 'Chickpeas',
  ),

];

List<QuestionModel>quiz2=[
  QuestionModel(
      question: 'What is the tallest mountain in the world?',
      answerOptions: ['K2','Mount Everest','Mount Kilimanjaro','Denali'],
      correctAnswer: 'Mount Everest',
  ),
  QuestionModel(
      question: 'First iPhone released in 2007?',
      answerOptions: ['True','False'],
      correctAnswer: 'True',
  ),
  QuestionModel(
      question: 'What is the chemical symbol for Gold?',
      answerOptions: ['Gd','Ag','Au'],
      correctAnswer: 'Au',
  ),
  QuestionModel(
    question: 'What is the capital city of Australia?',
    answerOptions: ['Sydney','Canberra','Melbourne'],
    correctAnswer: 'Canberra',
  ),

];