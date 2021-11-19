import 'package:flutter/material.dart';
import 'package:pokedex/features/home/pages/home_error.dart';
import 'package:pokedex/features/home/pages/home_load.dart';
import 'package:pokedex/features/home/pages/pokedex_home_page.dart';
import 'package:pokedex/features/home/repository/pokemon_repository.dart';
import 'package:pokedex/models/pokemon.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key, required this.repository}) : super(key: key);
  final IPokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    //Com o futurebuilder consigo controlar qual pagina será exibida na tela inicial do app
    return FutureBuilder<List<Pokemon>>(
        future: repository.getAllPokemons(),
        builder: (context, snapshot) {
          //Waiting, none,active,done são os parametros do enum ConnectionState que permitem saber como a conexão está
          if (snapshot.connectionState == ConnectionState.waiting) {
            return HomeLoad();
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return HomePage(list: snapshot.data!);
          }

          if (snapshot.hasError) {
            return HomeError(
              error: snapshot.error.toString(),
            );
          }

          return Container(); // Caso todas as opções passem despercebidas o futurebuilder retorna um container como ultimo caso
        });
  }
}
