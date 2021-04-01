import 'package:flutter/material.dart';
import 'package:pokedex/screens/PokedexScreen.dart';
import 'package:pokedex/screens/PokemonScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
      ),
      initialRoute: PokedexScreen.routeName,
      routes: {
        PokedexScreen.routeName: (ctx) => PokedexScreen(),
        PokemonScreen.routeName: (ctx) => PokemonScreen(),
      },
    );
  }
}
