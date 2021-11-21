// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pokedex/features/screens/details/container/details_container.dart';
import 'package:pokedex/models/pokemon.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list, required this.onUserTap})
      : super(key: key);
  final List<Pokemon> list;
  final Function(String, PokedexDetailArguments) onUserTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(list[index].nome),
            //Quando o usuario clicar na imagem do pokemon desejado,e passado para as settings a url '/details'
            onTap: () => onUserTap(
                '/details', PokedexDetailArguments(nome: list[index].nome)),
          );
        },
      ),
    );
  }
}
