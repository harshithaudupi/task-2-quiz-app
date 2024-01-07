import 'package:flutter/material.dart';
import 'package:quiz_app/screens/background.dart';

class ResultScreen extends StatelessWidget {
  final String playerName;
  final int score;
  final int totalQuestions;

  ResultScreen(this.playerName, this.score, this.totalQuestions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Result'),
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {
              // Perform the action when the "Back" button is pressed
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
        child:Padding(
           padding: const EdgeInsets.all(200.0),
           child:Card(
             color: Colors.black54, // Set your desired light background color
             elevation: 25.0, // Set elevation for a shadow effect
             child: Padding(
             padding: const EdgeInsets.all(6.0),
              child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                    'Congratulations, $playerName!',
                     style: TextStyle(fontSize: 24),
                   ),
                  SizedBox(height: 10),
                   Text(
                    'Your Score: $score out of $totalQuestions',
                     style: TextStyle(fontSize: 20),
                   ),
          ],
        ),
      ),
    ),
    ),
    ),
    );
  }
}

