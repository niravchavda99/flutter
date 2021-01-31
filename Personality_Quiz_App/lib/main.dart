import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  static const _questions = [
    {
      'questionText': 'What\'s your fav color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Blue', 'score': 3},
        {'text': 'Green', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s your fav animal?',
      'answers': [
        {'text': 'Bull', 'score': 2},
        {'text': 'Dog', 'score': 15},
        {'text': 'Cat', 'score': 7},
        {'text': 'Horse', 'score': 9}
      ]
    },
    {
      'questionText': 'Who\'s your fav actor?',
      'answers': [
        {'text': 'Ranbir Kapoor', 'score': 10},
        {'text': 'Ranveer Singh', 'score': 8},
        {'text': 'Kartik Aryan', 'score': 3},
        {'text': 'Hritik Roshan', 'score': 15}
      ]
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });

    if (_questionIndex < _questions.length) {
      print("We have more questions...");
    } else {
      print("No more questions");
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personality Quiz'),
        ),
        body: (_questionIndex < _questions.length)
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
