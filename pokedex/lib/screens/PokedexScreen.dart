import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/models/Pokemon.dart';
import 'package:pokedex/utils/Utils.dart';
import 'package:pokedex/widgets/PokemonTile.dart';

class PokedexScreen extends StatefulWidget {
  static const routeName = '/pokedex';
  static const String _API_ENDPOINT = 'https://pokeapi.co/api/v2/pokemon/';

  PokedexScreen({Key key}) : super(key: key);

  @override
  _PokedexScreenState createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  List<dynamic> pokemons = [];

  @override
  void initState() {
    super.initState();
    _loadPokemons();
  }

  void _loadPokemons() async {
    try {
      final response =
          await http.get(Uri.parse('${PokedexScreen._API_ENDPOINT}?limit=20'));
      var allPokemons = json.decode(response.body)['results'];
      setState(() {
        this.pokemons = allPokemons;
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<Pokemon> _fetchPokemon(final String name) async {
    final response =
        await http.get(Uri.parse('${PokedexScreen._API_ENDPOINT}$name'));
    var pokemon = json.decode(response.body);

    Pokemon p = Utils.parsePokemon(pokemon);
    return p;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pokédex',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemExtent: 150,
        shrinkWrap: true,
        itemCount: pokemons.length,
        itemBuilder: (ctx, i) => FutureBuilder(
          future: _fetchPokemon(pokemons[i]['name']),
          builder: (c, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());
            else {
              Pokemon pokemon = snapshot.data as Pokemon;
              return PokemonTile(pokemon);
            }
          },
        ),
      ),
    );
  }
}
