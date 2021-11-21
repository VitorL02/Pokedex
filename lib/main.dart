// ignore_for_file: prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/routes.dart';

import 'features/screens/home/repository/pokemon_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex - Vitor Lucas',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: PokedexRouter(
          repository: PokemonRepository(
        dio: Dio(),
      )),
    );
  }
}
