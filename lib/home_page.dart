import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController search = TextEditingController();
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
                  hintText: 'Search!',
                  hintStyle: TextStyle(fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),
            ),
          SizedBox(width: 20),
          Text('The current available free space is '),
          SizedBox(
            child: Image.asset('assets/grid space.png'),
          )
                ],
              ),
            )
         ],
        ));
  }
}
