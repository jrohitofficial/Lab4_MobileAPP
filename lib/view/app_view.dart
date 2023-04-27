import 'package:flutter/material.dart';

import '../models/app_model.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  var num1 = 1;
  var num2 = 2;

  var correctAnswer = 0;
  var wrongAnswer = 0;

  var counter = 0;

  late AppModel obj;

  void generateNumber() {
    obj = AppModel();
    setState(() {
      List<int> lstNum = obj.generateRandom();
      num1 = lstNum[0];
      num2 = lstNum[1];
    });
  }

  void checkAnswer({var num1 = 0, var num2 = 0}) {
    if (++counter > 10) {
      restartGame();
    } else {
      if (num1 > num2) {
        correctAnswer++;
      } else if (num1 < num2) {
        wrongAnswer++;
      }
      generateNumber();
    }
  }

  void restartGame() {
    correctAnswer = 0;
    wrongAnswer = 0;
    counter = 0;

    generateNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab4: Game"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Spacer(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
              onPressed: () {
                checkAnswer(num1: num1, num2: num2);
              },
              child: RichText(
                text: TextSpan(
                  text: '$num1',
                  style: const TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                checkAnswer(num1: num2, num2: num1);
              },
              child: RichText(
                text: TextSpan(
                  text: '$num2',
                  style: const TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
            ),
          ]),
          const Spacer(),
          RichText(
            text: const TextSpan(
              text: 'Result:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          Text("Correct Answers: $correctAnswer"),
          Text("Incorrect Answers: $wrongAnswer"),
          Text("Total Attempt: $counter"),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              restartGame();
            },
            child: const Text('Restart Game'),
          ),
          const Spacer(),
        ]),
      ),
    );
  }
}
