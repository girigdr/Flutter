
import 'package:flutter/material.dart';
import 'OpenPage.dart';


void main() {

runApp( 
  MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.black,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: Colors.black, // Background color of the entire app
      primaryColor: Colors.black,            // Primary color
      canvasColor: Colors.black,             // Color of widgets like drawers, bottom sheets
    ),
    home: OpenPage1() ,
    debugShowCheckedModeBanner: false ,
  )
) ;
}



