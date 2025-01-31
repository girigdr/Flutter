// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart' ;
import 'package:lottie/lottie.dart';

import 'Let_See_my_Profile/Education.dart';
import 'Let_See_my_Profile/Texhnologies.dart';
import 'Let_See_my_Profile/ValueNotifier.dart';
import 'SwipeUpAndDown.dart';

class OpenPage1 extends StatefulWidget {
  const OpenPage1({super.key});

  @override
  State<OpenPage1> createState() => _OpenPage1State();
}
class _OpenPage1State extends State<OpenPage1> {

  @override
  void dispose() {
    vn.dispose() ;
    swipeUP.dispose() ;
    education.dispose() ;
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width ;
    double deviceHeight = MediaQuery.of(context).size.height ;
    print( '$deviceWidth , $deviceHeight');
    return Scaffold(
      floatingActionButton:ValueListenableBuilder(
        valueListenable: swipeUP, 
        builder: (context, value, child) {
          if( value == 0 && deviceHeight < deviceWidth ) return FloatingActionButton(
            backgroundColor: Colors.transparent,
          onPressed: () {
            // setState(() {
              up_or_down.value = !up_or_down.value ;
            // });
              vn.value = !vn.value ;
          } ,
          child: ValueListenableBuilder(
            valueListenable: up_or_down,
            builder: (context, value, child) {
               return Icon( ( ! value ) ? Icons.arrow_downward : Icons.arrow_upward );
            },
          ),
          );
          else return SizedBox.shrink() ;
        }
      ) ,
      
      
       
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Stack(
            children: [

              ValueListenableBuilder(
                valueListenable: swipeUP, 
                builder: (context, value, child) {
                  if( value == 1 ) {
                    return Stack(
                      children: [
                        Positioned(
                          bottom: 0, // Start from the bottom
                          left: 0,
                          right: 0,
                          child: TweenAnimationBuilder(
                            curve: Curves.decelerate,
                            duration: Duration( milliseconds: 300 ),
                            tween: Tween< double > ( begin: 0 , end: deviceHeight - (deviceHeight / 20)  )  ,
                            builder: (context, value, child) {
                              return Swipeupanddown(value: value , swipe : swipeUP , vn : vn ); 
                            }
                          ),
                        )
                      ]
                    ) ;
                  }
                  else if ( value == 2 ) {
                    return Education() ;
                  }
                  else if ( value == 3 ) {
                    return Technologies() ;
                  }
                  // else if ( value ==4 ) {
                  //   // return Resumea() ;
                  // }
                  else 
                  return ( deviceHeight > deviceWidth ) ? staticMethods.mobileMainMethod( deviceHeight , deviceWidth) : staticMethods.desktopMainMethod( deviceHeight , deviceWidth , deviceHeight - (deviceHeight / 20) ); 
                  
                },
              ) ,
              
            ],
          ), 
        ),
      )
    );
  }
  
}



class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.2); // Start from 30% height on the left
    path.lineTo(size.width, 0); // Top-right corner
    path.lineTo(size.width, size.height); // Bottom-right corner
    path.lineTo(0, size.height); // Bottom-left corner
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}


class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path();
    path.moveTo(0, size.height * 0.2); // Start from 30% height on the left
    path.lineTo(size.width, 0); // Top-right corner
    path.lineTo(size.width, size.height); // Bottom-right corner
    path.lineTo(0, size.height); // Bottom-left corner
    path.close(); // Close the path

    final Paint borderPaint = Paint()
      ..color = Color.fromARGB(255, 0, 247, 255) // Border color
      ..style = PaintingStyle.stroke // Stroke only
      ..strokeWidth = 1.0; // Border width

    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}





//! --------------------  <> -------------------


class staticMethods {

  static AnimatedTextKit colorizedText( String text , List< Color > c , String family ,  double size ) {
    return AnimatedTextKit(
      animatedTexts: [
        ColorizeAnimatedText(
            text ,
          colors: c ,
          textStyle: TextStyle(
            fontSize: size ,
            fontFamily: family ,
          )
        ) ,
      ],
      totalRepeatCount: pow(2, 53) - 1 as int ,
    );
  }



  static GestureDetector mobileMainMethod( h , w ) {
    return GestureDetector(
      onVerticalDragEnd: (details) {
          // Check the velocity to confirm it's an upward swipe
        if ( swipeUP.value == 0 &&  details.primaryVelocity != null && details.primaryVelocity! < 0 ) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            swipeUP.value = 1 ;
          });
        }
      },
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //! First Box >>>>>>>>
              CustomPaint(
                painter: BorderPainter() ,
                child: ClipPath(
                  clipper: DiagonalClipper() ,
                  child: TweenAnimationBuilder(
                    curve: Curves.decelerate,
                    tween: Tween < double > ( begin: 0 , end: h / 2.6 ),
                    duration: Duration( milliseconds: 900 ), 
                    builder: (context, value, child) {
                      return containerUp(value);
                    },
                  ),
                ),
              ),
              SizedBox( height: 5 ,) ,
              //! second Box >>>>>>>>
              TweenAnimationBuilder(
                duration: Duration( milliseconds: 900 ) ,
                curve: Curves.decelerate,
                tween: Tween < double > (begin: 0 , end:  h / 2.6 ) ,
                builder : (context, value, child) {
                  if (value == h / 2.6 && ! vn.value) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      vn.value = true;
                    });
                  }
                  return containerDown( value , w , h / 2.6 ) ;
                },
              ) ,
          // Container(
          //    height :( h - ( h / 2.6 ) * 2 ) / 3,
          //    width: 10,
          //    color: const Color.fromARGB(0, 255, 193, 7),
          // ) ,
            ],
          ),
          //! Further Details >>>>>> 
          ValueListenableBuilder(
            valueListenable: vn, 
            builder: (context, value, child) {
              if( value ) {
                return Positioned(
                  // bottom: ,
                  // alignment: Alignment.bottomCenter ,
                  bottom: 0 ,
                  left: 1,
                  right: 1,
                  child: GestureDetector(
                    onTap: () {
                      print("swipeUP updated to fale !");
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        swipeUP.value = 1;
                        print("swipeUP updated to true!");
                      });
                    },
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 9,
                          left: 1,
                          right: 1 ,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:[
                              staticMethods.colorizedText( 
                                "Click or Swipe Up" , 
                                [
                                  const Color.fromARGB(255, 0, 119, 133),
                                  const Color.fromARGB(255, 0, 92, 104),
                                  const Color.fromARGB(255, 0, 151, 156),
                                  const Color.fromARGB(255, 0, 203, 218),
                                  const Color.fromARGB(255, 93, 255, 228),
                                ] ,
                                "h3" ,
                                20 ,
                              ) ,
                              Lottie.asset("assets/lotties/swipe.json")
                            ],
                          ),
                        ),
                        Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width - 80 ,
                            color: Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ) ;
              }
            return SizedBox.shrink() ;
            },
          ) ,
        ],
      ),
    );
  }



  static Container containerDown ( double h  , double w , double conHight) {
    return Container(
      height: h ,//370,
      width: 320,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 32, 131, 212) ,
          width: 1 
        ) ,
      ),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: conHight - ( conHight / 3 ),
                width: w - ( w / 5 ),
                decoration: BoxDecoration(
                  image: DecorationImage(fit: BoxFit.contain, image: AssetImage("assets/images/—Pngtree—3d cute cartoon male teacher_14745699.png"))
                ),
              ) ,
              Container(
                height: ( conHight / 3 ) / 3,
                width:  (w - ( w / 5 )) - ( w / 4 ) ,
                // color: Colors.amber,
                child: FittedBox(
                  child: staticMethods.colorizedText(
                    "GIRIDHARAN RAVI" ,
                    [
                        Colors.purple,
                        Colors.blue,
                        Colors.yellow,
                        Colors.red,
                    ] ,
                    "null" , 27
                  ),
                ),
              ) ,
              
              SizedBox( height: 1,) ,

              Container(
                height: ( conHight / 3 ) / 6.03,
                width:  (w - ( w / 5 )) - ( w / 2.5 ) ,
                // color: const Color.fromARGB(255, 0, 174, 255),
                child: FittedBox(
                  child: AnimatedTextKit(
                animatedTexts: [
                  nameLetter("SOFTWARE ENGINEER")
                ],
                totalRepeatCount: pow(2, 53) - 1 as int ,
              ),
                ),
              ) ,
            ],
          ),
        ),
      ),
    );
  }


  static Container containerUp ( double h ) {
    return Container(
      height: h,
      width: 320,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox( height: 100,) ,
              FittedBox(
                child: Text( 
                  "HII..." ,
                  style:  TextStyle(
                    fontFamily: "h1" ,
                    fontSize: 35 ,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ) ,
              Text( 
                "Let's see My Profile" ,
                style:  TextStyle(
                  fontFamily: "h1" ,
                  fontSize: 25 ,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ) ,
              Wrap(
                children: [
                  Text( 
                    "Enthusiastic and driven Fresher with a passion for Software Engineering and a solid foundation in software development, problem-solving, and system optimization. Completed a Bachelor's degree in Electronics and Communication Engineering, providing a strong analytical and technical background. Committed to leveraging skills and knowledge to develop innovative and efficient software solutions. Eager to learn, grow, and contribute to dynamic engineering teams." ,
                    style:  TextStyle(
                      fontFamily: "h2" ,
                      fontSize: 18 ,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ) ,
                ],
              )
            ],
          ),
        ),
      ),
    ) ;
  }


  static dynamic desktopContainerDown ( double h , double w , a ) {

    return Stack(
      children: [
        
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: h ,//370,
            width: w / 1.3,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 0, 140, 255) ,
                width: 1 
              ) ,
            ),
            child: ( h == a )? 
            
          
              SingleChildScrollView(
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: a - ( a / 9 ) ,
                      width: w / 1.3 ,
                      // color: Colors.green,
                
                      child:Row(
                        children: [
                          Container(
                            height:  h - ( h / 9 ) - 6,
                            width:(( w  / 1.3) / 2) - 1 ,
                            color: const Color.fromARGB(160, 0, 0, 0),
                            child: Container(
                              padding: EdgeInsets.all( 5 ) ,
                              decoration: BoxDecoration(
                                image: DecorationImage( fit: BoxFit.contain , image:AssetImage("assets/images/—Pngtree—3d cute cartoon male teacher_14745699.png") )
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all( 5 ),
                            height: h - ( h / 9 ) - 6,
                            width: ( w / 1.3 ) / 2  - 1,
                                            // color: const Color.fromARGB(255, 0, 102, 255), 
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: h / 7 ,
                                    width:  ( ( w / 1.3 ) / 2  - 1 ) - ( w / 20 ) ,
                                    // color: const Color.fromARGB(255, 35, 253, 170), 
                                    child: FittedBox(
                                      child: staticMethods.colorizedText(
                                        "GIRIDHARAN RAVI" ,
                                        [
                                            Colors.purple,
                                            Colors.blue,
                                            Colors.yellow,
                                            Colors.red,
                                        ] ,
                                        "h1" , w / 30 
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: h / 7 ,
                                    width:  ( ( w / 1.3 ) / 2  - 1 ) - ( w / 5 ) ,
                                    // color: const Color.fromARGB(255, 35, 253, 170), 
                                    child: FittedBox(
                                      child: AnimatedTextKit(
                                        animatedTexts: [
                                          WavyAnimatedText(
                                            "SOFTWARE ENGINEER" ,
                                            textStyle: TextStyle(
                                              fontFamily: 'h3',
                                              // fontSize: w / 35,
                                              height: 0.3,
                                              // color: Color.fromARGB(255, 0, 204, 255).withOpacity(0.8) ,
                                            ),
                                          )
                                        ],
                                        totalRepeatCount: pow(2, 53) - 1 as int ,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ) ,
                      ),
                SizedBox( height: 1) ,
                Container(
                  height:   ( h / 9 ) - 1,
                  width: w,
                    // color: const Color.fromARGB(255, 172, 76, 175),
                    child: FittedBox(
                      child: ValueListenableBuilder(
                                  valueListenable: vn, 
                                  builder: (context, value, child) {
                      if( value ) {
                        return Positioned(
                          // bottom: ,
                          // alignment: Alignment.bottomCenter ,
                          bottom: 0 ,
                          left: 1,
                          right: 1,
                          child: GestureDetector(
                            onTap: () {
                              print("swipeUP updated to fale !");
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                swipeUP.value = 1;
                                print("swipeUP updated to true!");
                              });
                            },
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 9,
                                  left: 1,
                                  right: 1 ,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:[
                                      staticMethods.colorizedText( 
                                        "Click or Swipe Up" , 
                                        [
                                          const Color.fromARGB(255, 0, 119, 133),
                                          const Color.fromARGB(255, 0, 92, 104),
                                          const Color.fromARGB(255, 0, 151, 156),
                                          const Color.fromARGB(255, 0, 203, 218),
                                          const Color.fromARGB(255, 93, 255, 228),
                                        ] ,
                                        "h3" ,
                                         20  ,
                                      ) ,
                                      SizedBox( width: 10 ,) ,
                                      Container(
                                        child: Lottie.asset("assets/lotties/swipe.json")
                                        
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width - 80 ,
                                    color: Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                        ) ;
                      }
                                  return SizedBox.shrink() ;
                                  },
                                ),
                    ) ,
                ),
                
                
                      ],),
              )
            
            
            : SizedBox.shrink() ,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: a,
            width: w,
            child: GestureDetector(
              onVerticalDragEnd: (details) {
                  // Check the velocity to confirm it's an upward swipe
                if ( swipeUP.value == 0 &&  details.primaryVelocity != null && details.primaryVelocity! < 0 ) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    swipeUP.value = 1 ;
                  });
                }
              },
            ),
          ),
        ) ,
      ],
    )  ;
  }

  /*

 Container(
              height: a - ( a / 10 ),
              width:  w / 1.3 ,
              color: Colors.amber,
              child: Row(
                children: [
                  Container(
                    height:  a - ( a / 10 ) ,
                        color: const Color.fromARGB(255, 149, 255, 154),
                    width: w / 2  ,
                    child: FittedBox(
                      child:SingleChildScrollView(
                        child: Container(
                          height:  a ,
                          width: h * 1.2  , // w - ( w /  1.4) ,
                          decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 61, 16, 16),
                            image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/images/—Pngtree—3d cute cartoon male teacher_14745699.png"))
                          ),
                        ),
                      ) ,
                    ),
                  ) , 
                  Container(
                    child: FittedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            color: const Color.fromARGB(255, 172, 171, 171),
                            height: a / 6 ,
                            width: w - ( w / 1.4 ) ,
                            child: FittedBox(
                              child: staticMethods.colorizedText(
                                "GIRIDHARAN RAVI" ,
                                [
                                    Colors.purple,
                                    Colors.blue,
                                    Colors.yellow,
                                    Colors.red,
                                ] ,
                                "null" , w / 30 
                              ),
                            ),
                          ),
                          Container(
                            
                            color: Colors.amber,
                            height: a / 10 ,
                            width: w - ( w / 1.3 ) ,
                            child: FittedBox(
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  WavyAnimatedText(
                                    "SOFTWARE ENGINEER" ,
                                    textStyle: TextStyle(
                                      fontSize: w / 35,
                                      height: 0.3,
                                      color: Color.fromARGB(255, 0, 204, 255).withOpacity(0.8) ,
                                    ),
                                  )
                                ],
                                totalRepeatCount: pow(2, 53) - 1 as int ,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ) , 
                ],
              ),
            ) ,
            Container(
              height: a /10  - 2 ,
              width:  w / 1.3 ,
              color: const Color.fromARGB(255, 1, 45, 241),
            ) ,
          
          
  */


  static WavyAnimatedText nameLetter( String l ) {
    return WavyAnimatedText(
      l ,
      textStyle: TextStyle(
        fontSize: 17,
        height: 0.3,
        color: Color.fromARGB(255, 0, 204, 255).withOpacity(0.8) ,
      ),
    );
  }
  
  static Container desktopContainerUp ( double h , double w , double a ) {

    return Container(
      height: h,
      width: w / 1.3,
      
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
                    children: [
                      SizedBox( height:  a / 5,) ,
                      Text( 
                        "HII..." ,
                        style:  TextStyle(
                          fontFamily: "h1" ,
                          fontSize: a / 6  ,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ) ,
                      SizedBox( height: a / 9 ,) ,
                      Text( 
                        "Let's see My Profile" ,
                        style:  TextStyle(
                          fontFamily: "h1" ,
                          fontSize:  a / 9  ,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ) ,
                      SizedBox( height:  a / 9,) ,
                      Wrap(
                        children: [
                          Text( 
                            "Enthusiastic and driven Fresher with a passion for Software Engineering and a solid foundation in software development, problem-solving, and system optimization. Completed a Bachelor's degree in Electronics and Communication Engineering, providing a strong analytical and technical background. Committed to leveraging skills and knowledge to develop innovative and efficient software solutions. Eager to learn, grow, and contribute to dynamic engineering teams." ,
                            style:  TextStyle(
                              fontFamily: "h2" ,
                              fontSize: a / 12 ,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ) ,
                        ],
                      )
                    ],
                  ),
        ),
      ),
    ) ;
    

  }



  static dynamic desktopMainMethod( double h , double w  , double a ) {
    return ValueListenableBuilder(
      valueListenable:  up_or_down,
      builder: (BuildContext context, dynamic value, Widget? child) {
        if(!value ) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: CustomPaint(
              painter: BorderPainter() ,
              child: ClipPath(
                clipper: DiagonalClipper() ,
                child: TweenAnimationBuilder(
                  curve: Curves.decelerate,
                  tween: Tween < double > ( begin: 0 , end: h / 1.2  ),
                  duration: Duration( milliseconds: 900 ), 
                  builder: (context, value, child) {
                    return desktopContainerUp(value , w , h / 1.2);
                  },
                ),
              ),
            ),
          );
        }
        else 
        //return GestureDetector(
        //   onVerticalDragEnd: (details) {
        //       if ( swipeUP.value == 0 &&  details.primaryVelocity != null && details.primaryVelocity! < 0 ) {
        //         WidgetsBinding.instance.addPostFrameCallback((_) {
        //           swipeUP.value = 1 ;
        //         });
        //       }
        //     },
          // child: 
          return Align(
            alignment: Alignment.topCenter,
            child: TweenAnimationBuilder(
              duration: Duration( milliseconds: 900 ) ,
              curve: Curves.decelerate,
              tween: Tween < double > (begin: 0 , end:   h - ( h / 10 )  ) ,
              builder : (context, value, child) {
                if (value ==  h - ( h / 10 )  && ! vn.value) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    vn.value = !vn.value;
                  });
                }
                return desktopContainerDown( value  , w ,   h - ( h / 10 )  ) ;
              },
            ),
          );
        // );  
      },
    ) ;
  }

}


/*
          SizedBox( height: 5 ,) ,
            //! second Box >>>>>>>>
            TweenAnimationBuilder(
              duration: Duration( milliseconds: 900 ) ,
              curve: Curves.decelerate,
              tween: Tween < double > (begin: 0 , end:  370 ) ,
              builder : (context, value, child) {
                if (value == 370 && ! vn.value) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    vn.value = true;
                  });
                }
                return containerDown( value ) ;
              },
            ) ,





            ValueListenableBuilder(
          valueListenable: vn, 
          builder: (context, value, child) {
            if( value ) {
              return Positioned(
                bottom: 10 ,
                left: 1,
                right: 1,
                child: GestureDetector(
                  onTap: () {
                    print("swipeUP updated to fale !");
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      swipeUP.value = 1;
                      print("swipeUP updated to true!");
                    });
                  },
                  child: Stack(
                    children: [
                      FloatingActionButton(
                        onPressed: () {

                        } , 
                        child: Icon( Icons.arrow_downward))  ,
                      Positioned(
                        bottom: 9,
                        left: 1,
                        right: 1 ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:[
                            staticMethods.colorizedText( 
                              "Click or Swipe Up" , 
                              [
                                const Color.fromARGB(255, 0, 119, 133),
                                const Color.fromARGB(255, 0, 92, 104),
                                const Color.fromARGB(255, 0, 151, 156),
                                const Color.fromARGB(255, 0, 203, 218),
                                const Color.fromARGB(255, 93, 255, 228),
                              ] ,
                              "h3" ,
                              20 ,
                            ) ,
                            Lottie.asset("assets/lotties/swipe.json")
                          ],
                        ),
                      ),
                      Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width - 80 ,
                          color: Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ) ;
            }
          return SizedBox.shrink() ;
          },
        ) ,

*/