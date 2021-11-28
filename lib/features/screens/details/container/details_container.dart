// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:pokedex/features/common/error.dart';
import 'package:pokedex/features/common/loading.dart';
import 'package:pokedex/features/screens/details/pages/detail_pages.dart';

import 'package:pokedex/features/screens/home/repository/pokemon_repository.dart';
import 'package:pokedex/models/pokemon.dart';
import '../../home/error/error.dart';

class PokedexDetailArguments {
  PokedexDetailArguments({
    required this.pokemon,
    this.index,
  });
  final Pokemon pokemon;
  final int? index;
}

class PokedexDetailContainer extends StatefulWidget {
  const PokedexDetailContainer({
    Key? key,
    required this.repository,
    required this.arguments,
    required this.onBack,
  }) : super(key: key);

  final IPokemonRepository repository;
  final PokedexDetailArguments arguments;
  final VoidCallback onBack;

  @override
  State<PokedexDetailContainer> createState() => _PokedexDetailContainerState();
}

class _PokedexDetailContainerState extends State<PokedexDetailContainer> {
  //Permite o valor de variavel ser nula porem se o valor for passado em uma função o nullsafety entra em ação e tranforma em nõa nulo
  late PageController controller;

  //Com essa variavel e possivel evitar o carregamento toda vez que o slide de pokemon ocorre
  late Future<List<Pokemon>> _future;
  Pokemon? _pokemon_change;

  @override
  void initState() {
    controller = PageController(
      viewportFraction: 0.5,
      initialPage: widget.arguments.index!,
    );
    _future = widget.repository.getAllPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return HomeLoad();
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            if (_pokemon_change == null) {
              _pokemon_change = widget.arguments.pokemon;
            }

            return PokedexDetail(
              //Passa o nome do pokemon como parametro para selecionar os dados de qual pokemon
              pokemon: _pokemon_change!,
              //Necessario utilizar a exclamação para garantir que essa lista sempre tera um valor,nunca vazio
              list: snapshot.data!,
              onBack: widget.onBack,
              controller: controller,
              onChangePokemon: (Pokemon value) {
                setState(() {
                  _pokemon_change = value;
                });
              },
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
