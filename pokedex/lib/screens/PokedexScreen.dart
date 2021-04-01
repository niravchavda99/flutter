import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PokedexScreen extends StatefulWidget {
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
      final response = await http
          .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=20'));
      var allPokemons = json.decode(response.body)['results'];
      setState(() {
        this.pokemons = allPokemons;
      });
    } on Exception catch (e) {
      print(e);
    }
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
        itemCount: pokemons.length,
        itemBuilder: (context, i) => Container(
          width: double.infinity,
          child: Text(pokemons[i]['name']),
        ),
      ),
    );
  }
}
