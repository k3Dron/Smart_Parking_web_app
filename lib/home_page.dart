import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_parking_app/grid_components.dart/grids_showed.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController search = TextEditingController();  
  Future<Map<String, List<dynamic>>> data = Future.value({});

  Future<Map<String, List>> getArr() async {
    const String link ='http://10.0.2.2:5000/';
    try{
      final response = await http.get(Uri.parse(link));
    if( response.statusCode != 200) {
      throw 'An Unexpected Error Has Occured';
    } 
    final jsonResponse = jsonDecode(response.body);
    print('the data in async fn $jsonResponse');
    setState(() {
      data = jsonResponse;
    });
    return jsonResponse;
    } catch(e) {
      throw(e).toString();
    }
  }
  @override
  void initState() {
    super.initState();
    getArr();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading:const Icon(Icons.share_location_outlined, size: 40,),
        title:const Text('S-Park',
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 43),),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 8,
      ),
      body: FutureBuilder(
       future: data,
       builder: (context, snapshot) {
        
        // if(snapshot.hasError) {
        //     return const Center(
        //       child: Text('Opps, An error has occured'),
        //     ); }

        // if(snapshot.data == null) {
        //   return const Center(
        //       child: Text('Opps, Data not recieved'),);
        // }
        print(snapshot.data);
        final info = snapshot.data;
        print('this is data in future builder $info');
        final arr = info?['query'] ?? [];
        final val = arr.length;
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/map.png'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                setState(() {
                  data = getArr();
                });
              }, child:const Text('find', style: TextStyle(color: Colors.black),)),
              Text('$val')
            ],
          ),
        );
       }
       )
        // body: Column(
        //  children: [
        //   const SizedBox(height: 20),
        //   Image.asset('assets/map.png'),
        //     SizedBox(height: 7),
        //     Container(
        //       padding: EdgeInsets.all(20),
        //       margin: EdgeInsets.symmetric(horizontal: 48),
        //       decoration: BoxDecoration(
        //         color: Theme.of(context).colorScheme.secondary,
        //         borderRadius: BorderRadius.circular(30)
        //       ),
        //       child: Column(
        //         children: [
        //           Padding(
        //       padding: const EdgeInsets.all(8.0),
              // child: TextField(
              //   controller: search,
              //   decoration: InputDecoration(
              //     fillColor: Theme.of(context).colorScheme.onSecondary,
              //     hintText: 'Search!',
              //     hintStyle: TextStyle(fontWeight: FontWeight.bold),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(20)
              //     )
              //   ),
              //   onSubmitted: ,
              // ),
        //       child: ElevatedButton(
        //         onPressed: () {
        //           print('pressed');
        //           setState(() {
        //             bata = getArr();
        //           });
        //         }, child: Text('Show me available spots in Hostel 2'),
        //       ),
        //     ),
        //   SizedBox(width: 20),
        //   Text('The arr is $val')
        //         ],
        //       ),
        //     )
        //  ],
        // )
        );
  }
}
