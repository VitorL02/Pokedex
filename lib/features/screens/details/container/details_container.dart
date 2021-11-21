// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:pokedex/features/common/error.dart';
import 'package:pokedex/features/common/loading.dart';
import 'package:pokedex/features/screens/details/pages/detail_pages.dart';

import 'package:pokedex/features/screens/home/repository/pokemon_repository.dart';
import 'package:pokedex/models/pokemon.dart';
import '../../home/error/error.dart';

class PokedexDetailArguments {
  PokedexDetailArguments({required this.nome});
  final String nome;
}

class PokedexDetailContainer extends StatelessWidget {
  const PokedexDetailContainer(
      {Key? key, required this.repository, required this.arguments})
      : super(key: key);
  final IPokemonRepository repository;
  final PokedexDetailArguments arguments;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: repository.getAllPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return HomeLoad();
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return PokedexDetail(
              //Passa o nome do pokemon como parametro para selecionar os dados de qual pokemon
              nome: arguments.nome,
            );
          }

          if (snapshot.hasError) {
            var mensagem;
            return HomeError(
              error: (snapshot.error as Error).mensagem!,
            );
          }

          return Container();
        });
  }
}
