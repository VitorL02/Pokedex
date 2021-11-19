// ignore_for_file: unused_local_variable, empty_catches

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex/features/home/consts/consts_api.dart';
import 'package:pokedex/features/home/error/error.dart';
import 'package:pokedex/models/pokemon.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllPokemons();
}

class PokemonRepository implements IPokemonRepository {
  PokemonRepository({required this.dio});

  final Dio dio;
  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response = await dio.get(ConstsApi
          .allPokemons); //Junto do dio faz a requisição da api dos pokemon retornando um json

      final json = jsonDecode(response.data) as Map<String,
          dynamic>; //Mapeia o Json e cria uma lista de strings dinamica

      final list = json['pokemon'] as List<dynamic>;

      return list.map((e) => Pokemon.fromMap(e)).toList();
    } catch (e) {
      throw Error('Impossivel receber os dados,você pode estar sem sinal');
    }
  }
}
