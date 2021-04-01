import 'package:flutter/material.dart';
import 'package:pokedex/utils/Utils.dart';

class Type extends StatelessWidget {
  final String type;

  const Type(this.type, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      width: 70,
      decoration: BoxDecoration(
        color: Utils.typeColorCodes[type]['bgColor'],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Text(
          type,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Utils.typeColorCodes[type]['textColor'],
          ),
        ),
      ),
    );
  }
}
