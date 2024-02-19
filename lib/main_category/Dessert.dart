import 'package:flutter/material.dart';
import 'dart:io';

class DessertScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dessert Screen'),
      ),
      body: Center(
        child: Text('This is the dessert screen!'),
      ),
    );
  }
}
