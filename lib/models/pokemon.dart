import 'package:flutter/material.dart';

class Pokemon {
  final String nome;
  final String image;
  final List<String> tipo;
  final int id;
  final String ordem;

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
      nome: json['name'],
      image: json['img'],
      tipo: (json['type'] as List<dynamic>)
          .map(
            (e) => e as String,
          )
          .toList(), //Converte o texto  de types string em uma lista
      id: json['id'],
      ordem: json['num'],
    );
  }

  Color? get baseColor => _color(tipo: tipo[0]);

  Pokemon(
      {required this.nome,
      required this.image,
      required this.id,
      required this.ordem,
      required this.tipo});

  static Color? _color({required String tipo}) {
    switch (tipo) {
      case 'Normal':
        return Colors.brown[400];
      case 'Fire':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyanAccent[400];
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.orange[300];
      case 'Flying':
        return Colors.indigo[200];
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.lightGreen[500];
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo[400];
      case 'Dark':
        return Colors.brown;
      case 'Dragon':
        return Colors.indigo[800];
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
    }
  }
}
