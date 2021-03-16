import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  final Function onClick;

  Button({
    Key key,
    this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 0.5, right: 0.5, top: 0.5),
        height: 90,
        child: TextButton(
          child: Text(this.text),
          onPressed: onClick,
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith((_) => this.backgroundColor),
            foregroundColor:
                MaterialStateProperty.resolveWith((_) => this.foregroundColor),
            textStyle: MaterialStateProperty.resolveWith(
                (_) => TextStyle(fontSize: 30)),
            overlayColor: MaterialStateProperty.resolveWith(
                (_) => Theme.of(context).accentColor),
          ),
        ),
      ),
    );
  }
}
