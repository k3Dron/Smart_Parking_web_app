import 'package:flutter/material.dart';
import 'package:smart_parking_app/grid_components.dart/grids_showed.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController search = TextEditingController();
  final List<int> gridsLength = [1, 0, 0 ,1 ,1 ,0];
  int val = 0;
  @override
  void initState() {
    super.initState();
    for(int i in gridsLength) {
      if(i == 0) {
        val++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Column(
         children: [
          const SizedBox(height: 20),
          Image.asset('assets/map.png'),
            SizedBox(height: 7),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 48),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Column(
                children: [
                  Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: search,
                decoration: InputDecoration(
                  fillColor: Theme.of(context).colorScheme.onSecondary,
                  hintText: 'Search!',
                  hintStyle: TextStyle(fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),
            ),
          SizedBox(width: 20),
          Text('The current available free space is $val'),
          // Padding(
          //   padding: const EdgeInsets.all(15.0),
          //   child: Container(
          //     width: double.infinity,
          //     color: Theme.of(context).colorScheme.onSecondary,
          //     child: Grid(arr: arr),
          //   ),
          // )
                ],
              ),
            )
         ],
        ));
  }
}
