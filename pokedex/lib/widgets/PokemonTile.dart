import 'package:flutter/material.dart';
import 'package:pokedex/screens/PokemonScreen.dart';
import 'package:pokedex/utils/Utils.dart';
import 'package:pokedex/widgets/Type.dart';
import '../models/Pokemon.dart';

class PokemonTile extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonTile(this.pokemon, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IMAGE_URL =
        'https://assets.pokemon.com/assets/cms2/img/pokedex/full/${Utils.pad(pokemon.id, 3)}.png';
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(PokemonScreen.routeName, arguments: pokemon);
        },
        child: Card(
          elevation: 5,
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          '#' + Utils.pad(pokemon.id, 3),
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          Utils.capitalize(pokemon.name),
                          style: TextStyle(
                            fontSize: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: pokemon.types
                        .map((type) => Type(
                              Utils.capitalize(type.name),
                            ))
                        .toList(),
                  ),
                ],
              ),
              Expanded(child: Text('')),
              Container(
                width: 150,
                height: 150,
                child: Image.network(
                  IMAGE_URL,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
