import 'package:flutter/material.dart';
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
    return Positioned(
      top: 80,
      left: 0,
      right: 0,
      height: 350,
      child: Container(
        color: pokemon.baseColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              height: 200,
              width: double.infinity,
              child: PageView(
                onPageChanged: (index) {
                  onChangePokemon(list[index]);
                },
                controller: controller,
                children: list.map((e) {
                  bool diff = e.nome != pokemon.nome;
                  return AnimatedOpacity(
                    duration: Duration(milliseconds: 500),
                    opacity: diff ? 0.5 : 1.0,
                    child: TweenAnimationBuilder<double>(
                        curve: Curves.easeIn,
                        duration: Duration(milliseconds: 500),
                        tween: Tween<double>(
                            end: diff ? 80 : 175, begin: diff ? 175 : 80),
                        builder: (context, value, child) {
                          return Center(
                            child: Image.network(e.image,
                                height: value,
                                fit: BoxFit.contain,
                                color: diff
                                    ? Colors.black.withOpacity(0.4)
                                    : null),
                          );
                        }),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
