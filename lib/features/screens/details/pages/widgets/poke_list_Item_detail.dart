import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class PokeListItemDetail extends StatelessWidget {
  const PokeListItemDetail(
      {Key? key, required this.isDiff, required this.pokemon})
      : super(key: key);

  final bool isDiff;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: isDiff ? 0.5 : 1.0,
        child: TweenAnimationBuilder<double>(
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 500),
            tween:
                Tween<double>(end: isDiff ? 80 : 175, begin: isDiff ? 175 : 80),
            builder: (context, value, child) {
              return Image.network(pokemon.image,
                  height: value,
                  fit: BoxFit.contain,
                  color: isDiff ? Colors.black.withOpacity(0.4) : null);
            }),
      ),
    );
  }
}
