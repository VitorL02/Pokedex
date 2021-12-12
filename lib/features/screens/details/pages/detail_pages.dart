// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pokedex/features/screens/details/pages/widgets/detail_appBar_widget.dart';
import 'package:pokedex/features/screens/details/pages/widgets/poke_detailList_widget.dart';
import 'package:pokedex/models/pokemon.dart';

class PokedexDetail extends StatefulWidget {
  const PokedexDetail({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.onBack,
    required this.controller,
    required this.onChangePokemon,
  }) : super(key: key);

  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  State<PokedexDetail> createState() => _PokedexDetailState();
}

class _PokedexDetailState extends State<PokedexDetail> {
  late ScrollController scroll_position;
  bool isOnTop = true;

  @override
  void initState() {
    super.initState();
    scroll_position = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NotificationListener(
      onNotification: (notification) {
        setState(() {
          if (scroll_position.position.pixels > 37) {
            isOnTop = false;
          } else if (scroll_position.position.pixels <= 36) {
            isOnTop = true;
          }
        });
        return false;
      },
      child: CustomScrollView(
        controller: scroll_position,
        //Retira a animação de movimento da imagem do pokemon
        physics: ClampingScrollPhysics(),
        slivers: [
          AppBarDetail(
            isOnTop: isOnTop,
            pokemon: widget.pokemon,
            onBack: widget.onBack,
          ),
          PokemonDetailListWidget(
            pokemon: widget.pokemon,
            list: widget.list,
            controller: widget.controller,
            onChangePokemon: widget.onChangePokemon,
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  color: widget.pokemon.baseColor,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
