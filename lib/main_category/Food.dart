import 'package:flutter/material.dart';
import 'dart:io';

class FoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food'),
      ),
      body: GridView.count(
        crossAxisCount: 2, // 열의 수
        children: List.generate(4, (index) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lunch_dining, size: 48), // 아이콘 추가
                SizedBox(height: 8), // 간격 조정
                Text(
                  'Food $index', // 작은 텍스트 추가
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
