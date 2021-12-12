import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class AppBarDetail extends StatelessWidget {
  const AppBarDetail(
      {Key? key,
      required this.pokemon,
      required this.onBack,
      required this.isOnTop})
      : super(key: key);
  final Pokemon pokemon;
  final VoidCallback onBack;
  final bool isOnTop;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true, //Garante que apesar do scroll a app bar e fixa
      elevation: 0,
      backgroundColor: pokemon.baseColor,
      leading: IconButton(
        onPressed: onBack,
        icon: Icon(Icons.arrow_back),
      ),
      centerTitle: false,
      title: AnimatedOpacity(
        duration: Duration(milliseconds: 400),
        opacity: isOnTop ? 0 : 1,
        child: Text(pokemon.nome),
      ),
    );
  }
}
