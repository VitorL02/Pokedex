// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list}) : super(key: key);
  final List<Pokemon> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
