// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pokedex/features/screens/details/pages/widgets/detail_appBar_widget.dart';
import 'package:pokedex/features/screens/details/pages/widgets/poke_detailList_widget.dart';
import 'package:pokedex/models/pokemon.dart';

class PokedexDetail extends StatelessWidget {
  const PokedexDetail({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.onBack,
    required this.controller,
    required this.onChangePokemon,
  }) : super(key: key);

  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBarDetail(
            pokemon: pokemon,
            onBack: onBack,
          ),
          PokemonDetailListWidget(
            pokemon: pokemon,
            list: list,
            controller: controller,
            onChangePokemon: onChangePokemon,
          ),
        ],
      ),
    );
  }
}
