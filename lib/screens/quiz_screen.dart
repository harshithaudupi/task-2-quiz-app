import 'package:flutter/material.dart';
import 'package:quiz_app/screens/background.dart';
import 'package:quiz_app/screens/result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String playerName;

  QuizScreen(this.playerName);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the capital of France?',
      'options': ['Berlin', 'Madrid', 'Paris', 'Rome'],
      'correctIndex': 2,
    },
    {
      'question': 'Which planet is known as the Red Planet?',
      'options': ['Earth', 'Mars', 'Jupiter', 'Venus'],
      'correctIndex': 1,
    },
    {
      'question': 'In which year did World War I begin?',
      'options': ['1912', '1914', '1916', '1918'],
      'correctIndex': 1,
    },
    {
      'question': 'Who wrote the play "Romeo and Juliet"?',
      'options': ['Charles Dickens', 'Jane Austen', 'William Shakespeare', 'Leo Tolstoy'],
      'correctIndex': 2,
    },
    {
      'question': 'What is the largest mammal on Earth?',
      'options': ['Elephant', 'Blue Whale', 'Giraffe', 'Hippopotamus'],
      'correctIndex': 1,
    }

    // Add more questions as needed
  ];

  void _answerQuestion(int selectedOptionIndex) {
    setState(() {
      if (_questions[_currentQuestionIndex]['correctIndex'] == selectedOptionIndex) {
        _score++;
      }

      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        _showResultScreen();
      }
    });
  }

  void _showResultScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(widget.playerName, _score, _questions.length),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'BACK',
              style: TextStyle(
                color: Colors.white,

              ),
            ),
          ),
        ],
      ),
      body:Background(
       child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Question ${_currentQuestionIndex + 1}/${_questions.length}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  _questions[_currentQuestionIndex]['question'],
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: List.generate(
                _questions[_currentQuestionIndex]['options'].length,
                    (index) => Card(
                  elevation: 4, // Add elevation for a card-like appearance
                  margin: EdgeInsets.symmetric(vertical: 10), // Adjust vertical margin as needed

                    child: ElevatedButton(
                      onPressed: () => _answerQuestion(index),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      child: Text(_questions[_currentQuestionIndex]['options'][index]),
                    ),

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