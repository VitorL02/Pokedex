// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeLoad extends StatelessWidget {
  const HomeLoad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
