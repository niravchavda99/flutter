import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/models/Pokemon.dart';
import 'package:pokedex/models/PokemonType.dart';

class Utils {
  static const typeColorCodes = {
    'Bug': {'bgColor': Color(0xff94BC4A), 'textColor': Colors.white},
    'Dark': {'bgColor': Color(0xff736C75), 'textColor': Colors.white},
    'Dragon': {'bgColor': Color(0xff6A7BAF), 'textColor': Colors.white},
    'Electric': {'bgColor': Color(0xffE5C531), 'textColor': Colors.black},
    'Fairy': {'bgColor': Color(0xffE397D1), 'textColor': Colors.black},
    'Fighting': {'bgColor': Color(0xffCB5F48), 'textColor': Colors.white},
    'Fire': {'bgColor': Color(0xffEA7A3C), 'textColor': Colors.white},
    'Flying': {'bgColor': Color(0xff7DA6DE), 'textColor': Colors.black},
    'Ghost': {'bgColor': Color(0xff846AB6), 'textColor': Colors.white},
    'Grass': {'bgColor': Color(0xff71C558), 'textColor': Colors.black},
    'Ground': {'bgColor': Color(0xffCC9F4F), 'textColor': Colors.black},
    'Ice': {'bgColor': Color(0xff70CBD4), 'textColor': Colors.black},
    'Normal': {'bgColor': Color(0xffAAB09F), 'textColor': Colors.black},
    'Poison': {'bgColor': Color(0xffB468B7), 'textColor': Colors.white},
    'Psychic': {'bgColor': Color(0xffE5709B), 'textColor': Colors.white},
    'Rock': {'bgColor': Color(0xffB2A061), 'textColor': Colors.white},
    'Steel': {'bgColor': Color(0xff89A1B0), 'textColor': Colors.black},
    'Water': {'bgColor': Color(0xff539AE2), 'textColor': Colors.white},
  };

  static String capitalize(String s) {
    return s.substring(0, 1).toUpperCase() + s.substring(1).toLowerCase();
  }

  static String pad(int num, int pad) {
    String padded = num.toString();
    while (padded.length < pad) padded = "0" + padded;

    return padded;
  }

  static Pokemon parsePokemon(Map<String, dynamic> data) {
    return Pokemon(
      id: data['id'],
      name: data['name'],
      types: (data['types'] as List<dynamic>)
          .map((d) =>
              PokemonType(d['slot'], d['type']['name'], d['type']['url']))
          .toList(),
    );
  }
}
