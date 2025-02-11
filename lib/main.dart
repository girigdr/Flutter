import 'package:e_commerse/OpenPage/page1.dart';
import 'package:flutter/material.dart';

void main () {
  runApp( 
    MaterialApp(
      debugShowCheckedModeBanner: false ,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0) , background: Colors.black, brightness: Brightness.dark)
      // ),
      home: page1() ,
    )
  );
}