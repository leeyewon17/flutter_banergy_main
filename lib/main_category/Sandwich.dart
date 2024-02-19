import 'package:flutter/material.dart';
import 'dart:io';

class SandwichScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sandwich Screen'),
      ),
      body: Center(
        child: Text('This is the sandwich screen!'),
      ),
    );
  }
}
