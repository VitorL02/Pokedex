// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PokedexDetail extends StatelessWidget {
  const PokedexDetail({Key? key, required this.nome}) : super(key: key);
  final String nome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(nome),
      ),
    );
  }
}
