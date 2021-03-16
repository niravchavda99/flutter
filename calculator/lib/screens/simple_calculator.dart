import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import '../widgets/button.dart';

class SimpleCalculator extends StatefulWidget {
  SimpleCalculator({Key key}) : super(key: key);

  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String _inputText = "";

  static bool _isOperator(String value) {
    return value == "+" ||
        value == "-" ||
        value == "*" ||
        value == "/" ||
        value == "%";
  }

  void _clear() {
    setState(() {
      _inputText = "";
    });
  }

  void _delete() {
    setState(() {
      _inputText = _inputText.length < 1
          ? ""
          : _inputText.substring(0, _inputText.length - 1);
    });
  }

  void _append(String value) {
    String recentInput =
        _inputText.length < 1 ? "" : _inputText.characters.last;

    if (recentInput == '.' && value == '.') return;

    if (_isOperator(value) && _isOperator(recentInput)) {
      setState(() {
        _inputText = _inputText.substring(0, _inputText.length - 1) + value;
      });
      return;
    }

    setState(() {
      _inputText += value;
    });
  }

  void _calculate() {
    if (_inputText == "") return;
    final p = Parser();
    final e = p.parse(_inputText);
    double result = e.evaluate(EvaluationType.REAL, ContextModel());
    setState(() {
      _inputText = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color bgColor = Theme.of(context).primaryColor;
    final Color fgColor = Colors.white;
    final Color themeColor = Colors.white;

    return Scaffold(
      backgroundColor: themeColor,
      appBar: AppBar(
        title: Text(
          'Simple Calculator',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Text(
                this._inputText,
                style: TextStyle(
                  fontSize: 80,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Button(
                key: ValueKey('C'),
                text: 'C',
                backgroundColor: Colors.red,
                foregroundColor: fgColor,
                onClick: _clear,
              ),
              Button(
                key: ValueKey('<-'),
                text: '<-',
                backgroundColor: bgColor,
                foregroundColor: fgColor,
                onClick: _delete,
              ),
              Button(
                key: ValueKey('/'),
                text: '/',
                backgroundColor: bgColor,
                foregroundColor: fgColor,
                onClick: () => _append("/"),
              ),
              Button(
                key: ValueKey('*'),
                text: '*',
                backgroundColor: bgColor,
                foregroundColor: fgColor,
                onClick: () => _append("*"),
              ),
            ],
          ),
          Row(
            children: [
              Button(
                key: ValueKey('7'),
                text: '7',
                backgroundColor: Colors.grey,
                foregroundColor: fgColor,
                onClick: () => _append("7"),
              ),
              Button(
                key: ValueKey('8'),
                text: '8',
                backgroundColor: Colors.grey,
                foregroundColor: fgColor,
                onClick: () => _append("8"),
              ),
              Button(
                key: ValueKey('9'),
                text: '9',
                backgroundColor: Colors.grey,
                foregroundColor: fgColor,
                onClick: () => _append("9"),
              ),
              Button(
                key: ValueKey('-'),
                text: '-',
                backgroundColor: bgColor,
                foregroundColor: fgColor,
                onClick: () => _append("-"),
              ),
            ],
          ),
          Row(
            children: [
              Button(
                key: ValueKey('4'),
                text: '4',
                backgroundColor: Colors.grey,
                foregroundColor: fgColor,
                onClick: () => _append("4"),
              ),
              Button(
                key: ValueKey('5'),
                text: '5',
                backgroundColor: Colors.grey,
                foregroundColor: fgColor,
                onClick: () => _append("5"),
              ),
              Button(
                key: ValueKey('6'),
                text: '6',
                backgroundColor: Colors.grey,
                foregroundColor: fgColor,
                onClick: () => _append("6"),
              ),
              Button(
                key: ValueKey('+'),
                text: '+',
                backgroundColor: bgColor,
                foregroundColor: fgColor,
                onClick: () => _append("+"),
              ),
            ],
          ),
          Row(
            children: [
              Button(
                key: ValueKey('1'),
                text: '1',
                backgroundColor: Colors.grey,
                foregroundColor: fgColor,
                onClick: () => _append("1"),
              ),
              Button(
                key: ValueKey('2'),
                text: '2',
                backgroundColor: Colors.grey,
                foregroundColor: fgColor,
                onClick: () => _append("2"),
              ),
              Button(
                key: ValueKey('3'),
                text: '3',
                backgroundColor: Colors.grey,
                foregroundColor: fgColor,
                onClick: () => _append("3"),
              ),
              Button(
                key: ValueKey('%'),
                text: '%',
                backgroundColor: bgColor,
                foregroundColor: fgColor,
                onClick: () => _append("%"),
              ),
            ],
          ),
          Row(
            children: [
              Button(
                key: ValueKey('.'),
                text: '.',
                backgroundColor: Colors.grey,
                foregroundColor: fgColor,
                onClick: () => _append("."),
              ),
              Button(
                key: ValueKey('0'),
                text: '0',
                backgroundColor: Colors.grey,
                foregroundColor: fgColor,
                onClick: () => _append("0"),
              ),
              Button(
                key: ValueKey('00'),
                text: '00',
                backgroundColor: Colors.grey,
                foregroundColor: fgColor,
                onClick: () => _append("00"),
              ),
              Button(
                key: ValueKey('='),
                text: '=',
                backgroundColor: Colors.red,
                foregroundColor: fgColor,
                onClick: _calculate,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
