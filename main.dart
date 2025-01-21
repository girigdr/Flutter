import 'dart:async';
import 'package:flutter/material.dart';

import 'OpenPage.dart';

void main() {
  runApp(myPortfolio());
  Timer(
    Duration( seconds: 1),
     () {
      runApp( 
        MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.black,
              brightness: Brightness.dark
            ),
          ) ,
          home: OpenPage1() ,
          debugShowCheckedModeBanner: false ,
        )
      ) ;
     }
  ) ;
}


class myPortfolio extends StatelessWidget {
  const myPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          brightness: Brightness.dark
        ),
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( 
                "Welcome" , 
                style: TextStyle( 
                  fontSize: 50,
                  color: Color.fromARGB(255, 255, 255, 255) ,
                  fontFamily: "Macondo" ,
                  fontWeight: FontWeight.bold ,
                ),
              ) ,
              Text( 
                "to My Portpolio" , 
                style: TextStyle( 
                  fontSize: 30,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: "f2" ,
                  fontWeight: FontWeight.bold ,
                ),
              )
            ],
          ),
        ),
      ) ,
    );
  }
}
