import 'package:flutter/material.dart';
import 'package:pokedex/features/screens/details/pages/widgets/poke_list_Item_detail.dart';
import 'package:pokedex/models/pokemon.dart';

class PokemonDetailListWidget extends StatelessWidget {
  const PokemonDetailListWidget({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.controller,
    required this.onChangePokemon,
  }) : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: pokemon.baseColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      pokemon.nome,
                      style: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "#${pokemon.ordem}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: PageView(
                onPageChanged: (index) {
                  onChangePokemon(list[index]);
                },
                controller: controller,
                children: list.map(
                  (e) {
                    bool diff = e.nome != pokemon.nome;
                    return PokeListItemDetail(pokemon: e, isDiff: diff);
                  },
                ).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
