// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:pokedex/features/screens/details/container/details_container.dart';
import 'package:pokedex/features/screens/home/container/home_container.dart';
import 'package:pokedex/features/screens/home/repository/pokemon_repository.dart';

class PokedexRouter extends StatelessWidget {
  const PokedexRouter({Key? key, required this.repository}) : super(key: key);
  final PokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) {
              return HomeContainer(
                repository: repository,
                onUserTap: (route, arguments) {
                  Navigator.of(context).pushNamed(route, arguments: arguments);
                },
              );
            },
          );
        }
        if (settings.name == '/details') {
          return MaterialPageRoute(
            builder: (context) {
              return PokedexDetailContainer(
                repository: repository,
                arguments: (settings.arguments as PokedexDetailArguments),
              );
            },
          );
        }
      },
    );
  }
}
