// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:pokedex/features/screens/details/container/details_container.dart';
import 'package:pokedex/features/screens/home/pages/widgets/pokemon_type_widget.dart';
import 'package:pokedex/models/pokemon.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required this.pokemon, required this.ontap})
      : super(key: key);
  final Pokemon pokemon;
  final Function(String, PokedexDetailArguments) ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ontap('/details', PokedexDetailArguments(pokemon: pokemon)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: pokemon.baseColor!.withOpacity(0.8),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text(
                        pokemon.nome,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )),
                      Text(
                        '#${pokemon.ordem}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // Uma coluna para receber o tipo de pokemon que pode possuir um ou mais de um
                        children: pokemon.tipo
                            .map((e) => TypeWidget(tipo: e))
                            .toList(),
                      ),
                      // O widget flexible adapta a imagem para evitar quebra do layot
                      Flexible(
                          child: Container(
                        height: 100,
                        width: 100,
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          //Da o efeito da imagem sobrepor o tipo
          Positioned(
            bottom: 12,
            right: 2,
            child: Image.network(pokemon.image),
          )
        ],
      ),
    );
  }
}
