// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

class HomeLoad extends StatelessWidget {
  const HomeLoad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
