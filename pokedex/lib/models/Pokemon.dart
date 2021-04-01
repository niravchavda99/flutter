import 'package:flutter/foundation.dart';
import 'package:pokedex/models/PokemonType.dart';

class Pokemon {
  final int id;
  final String name;
  final List<PokemonType> types;

  Pokemon({
    @required this.id,
    @required this.name,
    @required this.types,
  });
}
