import 'package:flutter/material.dart';

class HomeError extends StatelessWidget {
  const HomeError({Key? key, this.error}) : super(key: key);
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(error ?? 'Não foi possivel realizar conexão'),
    ));
  }
}
