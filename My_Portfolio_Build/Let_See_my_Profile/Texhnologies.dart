

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'ValueNotifier.dart';

class Technologies extends StatefulWidget {
  const Technologies({super.key});

  @override
  State<Technologies> createState() => _TechnologiesState();
}

class _TechnologiesState extends State<Technologies> {
  @override
  Widget build(BuildContext context) {

    
    
    //! ------------------------------------
    final double width = MediaQuery.of(context).size.width ;
    final double height = MediaQuery.of(context).size.height ;
    //! ------------------------------------



    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 173, 114, 114),
        leading: IconButton(
          onPressed: (){
            setState(() {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) {
                  swipeUP.value = 0 ;
                  iconToShowFurtherDetailOfEducation1.value = false;
                  iconToShowFurtherDetailOfEducation2.value = false;
                  iconToShowFurtherDetailOfEducation3.value = false;
                  education.value = false ;
                  color.value = 0 ;
                }
              );
            });
          } ,
          icon: Icon( Icons.arrow_back_ios , color: const Color.fromARGB(255, 255, 255, 255), )
        ),
      ),
      body: ( height > width ) ? staticTech.forMobile( height , width ) :staticTech.forDesktop( height , width ) ,
    ) ;
  }
}

class staticTech {


  static dynamic up ( h , w) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
          SizedBox(height: h / 10 ,) ,
            SizedBox(
              height: 30,
              width: w - ( w / 10 ),
              child: FittedBox(
                child: AnimatedTextKit(
                  animatedTexts: [
                    nameLetter("BACKEND TECHONOLOGIES" , Color.fromARGB(255, 255, 255, 255).withOpacity(0.8)  ),
                  ],
                  repeatForever: true,
                ) 
              ),
            ) ,
            Column(
              children: [
                
                SizedBox(height: h / 10 ,) ,
                Text("Java"  ,  style: style( h , w , 1 ),) ,
                SizedBox(height: h / 20 ,) ,
                Text("MySQL",  style: style( h , w , 1 ),) ,
                SizedBox(height: h / 20 ,) ,
                Text("Object Oriented Programming ( OOPs )",  style: style( h , w , 1 ),) ,
                SizedBox(height: h / 20 ,) ,
                Text("Java DataBase Connectivity ( JDBC )",  style: style( h , w , 1 ),) ,
                SizedBox(height: h / 20 ,) ,
                Text("Java Server Pages",  style: style( h , w , 1),) ,
                SizedBox(height: h / 20 ,) ,
                Text("Servlets",  style: style( h , w , 1 ),) ,
                SizedBox(height: h / 20 ,) ,
                Text("Data Structure and Algorthims ( DSA )",  style: style( h , w , 1),) ,
                SizedBox(height: h / 20 ,) ,
                Text("Springboot",  style: style( h , w ,1 ),) ,
                SizedBox(height: h / 10 ,) ,
              ],
            )
          ],
        ),
      ),
    ) ;
  }


  static SingleChildScrollView down( h , w) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
          SizedBox(height: h / 10 ,) ,
            SizedBox(
              height: 30,
              width: w - ( w / 10 ),
              child: FittedBox(
                child: AnimatedTextKit(
                  animatedTexts: [
                    nameLetter("FRONTEND TECHONOLOGIES" , const Color.fromARGB(255, 163, 5, 5) ),
                  ],
                  repeatForever: true,
                ) 
              ),
            ) ,
            Column(
              children: [
                
                SizedBox(height: h / 10 ,) ,
                Text("Flutter"  ,  style: style( h , w , 0 ),) ,
                SizedBox(height: h / 20 ,) ,
                Text("Dart",  style: style( h , w ,0 ),) ,
                SizedBox(height: h / 20 ,) ,
                Text("Mobile App Development",  style: style( h , w , 0),) ,
                SizedBox(height: h / 20 ,) ,
                Text("Javascript",  style: style( h , w , 0),) ,
                SizedBox(height: h / 10 ,) ,
                
              ],
            )
          ],
        ),
      ),
    ) ;
  }


  static WavyAnimatedText nameLetter( String l , Color c ) {
    return WavyAnimatedText(
      l ,
      textStyle: TextStyle(
        fontSize: 17,
        height: 0.3,
        color: c,
        fontFamily: 'h3'
      ),
    );
  }

  static TextStyle style ( h ,  w , i ) {
    return TextStyle(
      fontFamily: 'h0' ,
      fontWeight: FontWeight.w100,
      fontSize: ( h > w ) ?  h / 20 : h / 5  ,
      color: i == 0 ? const Color.fromARGB(255, 163, 5, 5)  : Colors.white ,
    ) ;
  }



  static Padding forMobile( height ,width  ) {
    return Padding(
        
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Stack(
            children: [
             SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // SizedBox( height:   ( height > width ) ? height / 20 : ( 2 * height < width) ? height / 5 : height / 6 ,),
                   Column(
                    children: [
                      TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0, end: height - (height / 1.6)),
                        duration: Duration(milliseconds: 900),
                        curve: Curves.decelerate,
                        builder: (context, value, child) {
                            return Container(
                              height: value,
                              width: width - (width / 5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: const Color.fromARGB(255, 163, 5, 5),
                                ),
                                color: Colors.transparent, // Default color
                              ),
                              child: ValueListenableBuilder<int>(
                                valueListenable: color,
                                builder: (context, value, child) {
                                  return TweenAnimationBuilder(
                                    tween: ColorTween(
                                      begin: Colors.transparent,
                                      end: value == 1
                                          ? const Color.fromARGB(255, 163, 5, 5)
                                          : Colors.transparent,
                                    ),
                                    duration: Duration(milliseconds: 300),
                                    builder: (context, animatedColor, child) {
                                      return GestureDetector(
                                        onTap: () {
                                          if( color.value == 0 ||  color.value == 2 ) {
                                            color.value = 1 ;
                                          }
                                          else color.value = 0 ;
                                        },
                                        child: Container(
                                          color: animatedColor,
                                          child:staticTech.up(
                                            height - (height / 1.6),
                                            width - (width / 5),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            );


                          
                        },
                      ),
                        SizedBox(height: 5,),
                        TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0, end: height - (height / 1.6)),
                          duration: Duration(milliseconds: 900),
                          curve: Curves.decelerate,
                          builder: (context, value, child) {
                            return Container(
                              height: value,
                              width: width - (width / 5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: const Color.fromARGB(255, 255, 255, 255),
                                ),
                                color: Colors.transparent, // Default color
                              ),
                              child: ValueListenableBuilder<int>(
                                valueListenable: color,
                                builder: (context, value, child) {
                                  return TweenAnimationBuilder(
                                    tween: ColorTween(
                                      begin: Colors.transparent,
                                      end: value == 2
                                          ? const Color.fromARGB(255, 255, 255, 255)
                                          : Colors.transparent,
                                    ),
                                    duration: Duration(milliseconds: 300),
                                    builder: (context, animatedColor, child) {
                                      return GestureDetector(
                                        onTap: () {
                                          if( color.value == 0 ||  color.value == 1  ) {
                                            color.value = 2 ;
                                          }
                                          else color.value = 0 ;
                                        },
                                        child: Container(
                                          color: animatedColor,
                                          child:staticTech.down(
                                            height - (height / 1.6),
                                            width - (width / 5),
                                          ) ,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  ]
                )
              ) 
            ],
          ),
        ),
      );
  }


  static Padding forDesktop( double height , double width  ) {
     return Padding(
        
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder(
                curve: Curves.decelerate,
                tween: Tween< double > ( begin: 0 , end:  height - (height /7 ) ),
                duration: Duration( milliseconds: 1100 ), 
                builder: (context, value, child) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: width - (width / 1.6),
                      height: value,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1 , 
                          color: const Color.fromARGB(255, 255, 0, 0) ,
                        )
                      ),
                    
                    
                              child: ValueListenableBuilder<int>(
                        valueListenable: color,
                        builder: (context, value, child) {
                          return TweenAnimationBuilder(
                            tween: ColorTween(
                              begin: Colors.transparent,
                              end: value == 1
                                  ? const Color.fromARGB(255, 163, 5, 5)
                                  : Colors.transparent,
                            ),
                            duration: Duration(milliseconds: 300),
                            builder: (context, animatedColor, child) {
                              return GestureDetector(
                                onTap: () {
                                  if( color.value == 0 ||  color.value == 2 ) {
                                    color.value = 1 ;
                                  }
                                  else color.value = 0 ;
                                },
                                child: Container(
                                  color: animatedColor,
                                  child:staticTech.upDesktop(
                                    height - (height / 1.6),
                                    width - (width / 5),
                                  )  ,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    
                    
                    ),
                  ) ;
                },
              ),
              SizedBox(width: 5,) ,
              TweenAnimationBuilder(
                tween: Tween< double > ( begin: 0 , end:  height - (height /7) ),
                duration: Duration( milliseconds: 1100 ), 
                curve: Curves.decelerate,
                builder: (context, value, child) {
                  return Align(
                    alignment: Alignment.bottomRight ,
                    child: Container(
                      width: width - (width / 1.6),
                      height: value ,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1 , 
                          color: Colors.white ,
                        )
                      ),
                      child: ValueListenableBuilder<int>(
                        valueListenable: color,
                        builder: (context, value, child) {
                          return TweenAnimationBuilder(
                            tween: ColorTween(
                              begin: Colors.transparent,
                              end: value == 2
                                  ? const Color.fromARGB(255, 255, 255, 255)
                                  : Colors.transparent,
                            ),
                            duration: Duration(milliseconds: 300),
                            builder: (context, animatedColor, child) {
                              return GestureDetector(
                                onTap: () {
                                  if( color.value == 0 ||  color.value == 1  ) {
                                    color.value = 2 ;
                                  }
                                  else color.value = 0 ;
                                },
                                child: Container(
                                  color: animatedColor,
                                  child:  staticTech.downDesktop(
                                    height - (height / 1.6),
                                    width - (width / 5),
                                  ),
                                ),
                              ) ;
                            },
                          );
                        },
                      ),
                      // color: const Color.fromARGB(255, 23, 6, 255),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
  }



  static dynamic upDesktop ( h , w) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
          SizedBox(height: h / 10 ,) ,
            SizedBox(
              height: 30,
              width: w - ( w / 10 ),
              child: FittedBox(
                child: AnimatedTextKit(
                  animatedTexts: [
                    nameLetter("BACKEND TECHONOLOGIES" , Color.fromARGB(255, 255, 255, 255).withOpacity(0.8)  ),
                  ],
                  repeatForever: true,
                ) 
              ),
            ) ,
            Column(
              children: [
                
                SizedBox(height: w / 20 ,) ,
                FittedBox(child: Text("                   Java                    "  ,  style: style( h , w , 1 ),)) ,
                SizedBox(height: w / 20 ,) ,
                FittedBox(child: Text("                   MySQL                   ",  style: style( h , w , 1 ),)) ,
                SizedBox(height: w / 20 ,) ,
                FittedBox(child: Text("   Object Oriented Programming  ( OOPs )   ",  style: style( h , w , 1 ),)) ,
                SizedBox(height: w / 20 ,) ,
                FittedBox(child: Text("    Java DataBase Connectivity ( JDBC )    ",  style: style( h , w , 1 ),)) ,
                SizedBox(height: w / 20 ,) ,
                FittedBox(child: Text("             Java Server Pages             ",  style: style( h , w , 1),)) ,
                SizedBox(height: w / 20 ,) ,
                FittedBox(child: Text("                 Servlets                  ",  style: style( h , w , 1 ),)) ,
                SizedBox(height: w / 20 ,) ,
                FittedBox(child: Text("   Data Structure and Algorthims ( DSA )   ",  style: style( h , w , 1),)) ,
                SizedBox(height: w / 20 ,) ,
                FittedBox(child: Text("                 Springboot                ",  style: style( h , w ,1 ),)) ,
                SizedBox(height: w / 10 ,) ,
              ],
            )
          ],
        ),
      ),
    ) ;
  }




  static SingleChildScrollView downDesktop( h , w) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
          SizedBox(height: h / 10 ,) ,
            SizedBox(
              height: 30,
              width: w - ( w / 10 ),
              child: FittedBox(
                child: AnimatedTextKit(
                  animatedTexts: [
                    nameLetter("FRONTEND TECHONOLOGIES" , const Color.fromARGB(255, 163, 5, 5) ),
                  ],
                  repeatForever: true,
                ),
              ),
            ) ,
            Column(
              children: [
                
                SizedBox(height: w / 20 ,) ,
                FittedBox(child: Text("                    Flutter                    "  ,  style: style( h , w , 0 ),)) ,
                SizedBox(height: w / 20 ,) ,
                FittedBox(child: Text("                     Dart                      "  ,  style: style( h , w , 0 ),)) ,
                SizedBox(height: w / 20 ,) ,
                FittedBox(child: Text("             Mobile App Development            "  ,  style: style( h , w , 0 ),)) ,
                SizedBox(height: w / 20 ,) ,
                FittedBox(child: Text("                   Javascript                  "  ,  style: style( h , w , 0 ),)) ,
                SizedBox(height: w / 10 ,) ,
                
              ],
            )
          ],
        ),
      ),
    ) ;
  }
}