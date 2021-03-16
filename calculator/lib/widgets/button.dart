import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  final Function onClick;

  Button(
      {Key key,
      this.text,
      this.backgroundColor,
      this.foregroundColor,
      this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(1),
        height: 60,
        child: TextButton(
          child: Text(this.text),
          onPressed: onClick,
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith((_) => this.backgroundColor),
            foregroundColor:
                MaterialStateProperty.resolveWith((_) => this.foregroundColor),
            textStyle: MaterialStateProperty.resolveWith(
                (_) => TextStyle(fontSize: 20)),
          ),
        ),
      ),
    );
  }
}
