import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  var arr;
  Grid({super.key, required this.arr});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: arr.length,
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          width: 500,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: arr[index] == 0 ? Theme.of(context).colorScheme.tertiary : Theme.of(context).colorScheme.inversePrimary
          ),
        );
      },
      
    );
  }
}