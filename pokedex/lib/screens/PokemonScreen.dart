import 'package:flutter/material.dart';
import 'package:pokedex/models/Pokemon.dart';
import 'package:pokedex/utils/Utils.dart';

class PokemonScreen extends StatelessWidget {
  static const routeName = '/pokemon';

  const PokemonScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemon = ModalRoute.of(context).settings.arguments as Pokemon;
    final IMAGE_URL =
        'https://assets.pokemon.com/assets/cms2/img/pokedex/full/${Utils.pad(pokemon.id, 3)}.png';

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Column(
          children: [
            Text(
              Utils.capitalize('#' + Utils.pad(pokemon.id, 3)),
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            Text(
              Utils.capitalize(pokemon.name),
              style: TextStyle(
                color: Colors.black,
                fontSize: 34,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 500,
              child: Image.network(
                IMAGE_URL,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
