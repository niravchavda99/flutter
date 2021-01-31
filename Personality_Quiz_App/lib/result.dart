import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function handleReset;

  Result(this.resultScore, this.handleReset);

  String get resultPhrase {
    String resultText;

    if (resultScore <= 10)
      resultText = "You are awesome and innocent!";
    else if (resultScore <= 18)
      resultText = 'Pretty Likable!';
    else if (resultScore <= 24)
      resultText = 'You are ... strange!';
    else
      resultText = 'You are so bad!';

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
              child: Text(
                "Restart Quiz!",
              ),
              textColor: Colors.blue,
              onPressed: handleReset)
        ],
      ),
    );
  }
}
