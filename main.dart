import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
void main () {
  runApp (
    MaterialApp(
      debugShowCheckedModeBanner: false ,
        home: myApp(),
    )
  );
}
class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {

  bool b = false ;
  Color app_bar_color = Color(0xff1e0248) ;
  Color co = Colors.transparent ;
  double height = 0 ;
  int index = 1 ;
  @override
  Widget build(BuildContext context) {
    double device_hight = MediaQuery.of(context).size.height ;
    double device_width = MediaQuery.of(context).size.width ;
    double menuSize = ( device_hight < device_width  ) ? device_hight / 2 : device_hight / 4  ;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: GestureDetector(
        onTap: () {
          setState(() {
            hi = 0 ;
            wi = 0 ;
          });
        },
        child: Stack (
          children: [
            Column(
              children: [
                Container(
                  height: 37.7 ,
                  width: device_width ,
                  decoration: BoxDecoration(
                    color: Color(0xff988bab) ,
                  ),
                ) ,
                // AppBar Immovable
                Container(
                  height: ( device_hight < device_width  ) ? device_hight / 4 : device_hight / 9  ,
                  width: device_width,
                  decoration: BoxDecoration(
                    color: app_bar_color ,

                  ),
                  child: Row(
                    crossAxisAlignment:CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            curve: Curves.bounceIn,
                            "TRADE</>INFO.com" ,
                            textStyle: TextStyle(
                                color: Color(0xff9aadf3) ,
                                fontSize: device_width / 20 ,
                                fontWeight: FontWeight.w100,
                                fontFamily: 'Merienda-Regular'
                            ),
                            speed: Duration( milliseconds: 140 ),
                          )
                        ],
                        totalRepeatCount: 1,
                      ) ,
                      IconButton(
                        onPressed: () {
                          setState(() {
                            height = height == 0 ? ( device_hight < device_width  ) ? device_hight / 2 : device_hight / 4  : 0;
                          });
                        },
                        icon: Icon (Icons.menu , color: Color(0xff9aadf3) , size: 25,),
                      ) ,
                    ],
                  ),
                ),

                TweenAnimationBuilder(
                    tween: Tween<double>( begin: height ,end:  height ),
                    duration: Duration(milliseconds: 140 ) ,
                    builder: ( BuildContext c , double ? val , Widget ? child ) {
                      return AnimatedContainer (
                        curve: Curves.decelerate,
                        duration: Duration(milliseconds: 140 ) ,
                        height: val ,
                        width: device_width,
                        decoration: BoxDecoration(
                            color: Color(0xff031481).withOpacity(0.7)
                        ),
                        child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  child: Container(
                                    // decoration: BoxDecoration(color: Colors.black),
                                      height: menuSize / 3,
                                      width: device_width ,
                                      child: Center (
                                        child: Text(
                                          "HOME" ,
                                          style: TextStyle(
                                              color: Color(0xff151e65) ,
                                              fontSize: device_width / 20,
                                              fontWeight: FontWeight.w100,
                                              fontFamily: 'Merienda-Regular'
                                          ),
                                        ) ,
                                      )
                                  ),
                                  onTap: () {
                                    print ( '${device_width} , ${device_hight}' ) ;
                                  },
                                ),
                                Container(height: 0.7, width : device_width - 40 ,decoration: BoxDecoration( color: Colors.black),),
                                GestureDetector(
                                  child: Container(
                                    // decoration: BoxDecoration(color: Colors.deepPurple),
                                      height: menuSize / 3,
                                      width: device_width ,
                                      child: Center (
                                        child: Text(
                                          "SERVICES" ,
                                          style: TextStyle(
                                              color: Color(0xff151e65) ,
                                              fontSize: device_width / 20,
                                              fontWeight: FontWeight.w100,
                                              fontFamily: 'Merienda-Regular'
                                          ),
                                        ) ,
                                      )
                                  ),
                                ),
                                Container(height: 0.7, width : device_width - 40 , decoration: BoxDecoration( color: Colors.black),),
                                GestureDetector(
                                  child: Container(
                                    // decoration: BoxDecoration(color: Colors.black),
                                      height: menuSize /3,
                                      width: device_width ,
                                      child: Center (
                                        child: Text(
                                          "CONTACT" ,
                                          style: TextStyle(
                                              color: Color(0xff151e65) ,
                                              fontSize: device_width / 20,
                                              fontWeight: FontWeight.w100,
                                              fontFamily: 'Merienda-Regular'
                                          ),
                                        ) ,
                                      )
                                  ),
                                ),
                              ],
                            )
                        ) ,
                      ) ;
                    }
                ),
                Expanded(
                    child: Padding(
                      padding: EdgeInsets.only( left: 0 , right:  0 ) ,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: ( device_hight < device_width  ) ? device_hight * 2 : 400 ,
                                  width: device_width ,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage("assets/images/t2.jpg") , fit: BoxFit.cover) ,
                                  ),
                                ),
                                TweenAnimationBuilder(
                                    duration: Duration(milliseconds: 1200 ),
                                    tween: Tween < double > ( begin:  0 , end:  1 ),
                                    builder: (BuildContext context, double value, Widget? child) {
                                      return Column(
                                        children: [
                                          SizedBox(height: device_width / 20,),
                                          Padding(padding: EdgeInsets.only( right: device_width / 3.5 ,  left: value * 25 , top : value * 10 ) ,
                                            child: Text(
                                              "We are \nChanging the \nWorld with \nTechonology",
                                              style: TextStyle(
                                                  color: Color(0xffffffff) ,
                                                  fontSize:  device_width / 12,
                                                  fontWeight: FontWeight.w100,
                                                  fontFamily: 'Merienda-Regular'
                                              ),
                                            ),
                                          ) ,
                                          SizedBox(height: device_width / 20,),
                                          Padding(padding: EdgeInsets.only( left : device_width / 2 , right : value * 10 ,bottom : value * 10  ) ,
                                            child: Text(
                                              "   Let's us\nEmpower\n Together",
                                              style: TextStyle(
                                                  color: Color(0xffffffff) ,
                                                  fontSize: device_width / 12 ,
                                                  fontWeight: FontWeight.w100,
                                                  fontFamily: 'Merienda-Regular'
                                              ),
                                            ),
                                          ) ,
                                        ],
                                      );
                                    }
                                ),
                              ],
                            ) ,
                            SizedBox(height: 15,),
                            Container(
                              height: ( device_width > device_hight ) ?device_hight * 2 : device_hight / 2.9,
                              width: device_width - 30 ,
                              decoration: BoxDecoration(
                                color: Colors.black ,
                              ),
                              child: Center(
                                  child: GestureDetector(
                                    onHorizontalDragStart: (_) {
                                      setState(() {
                                        index = ( ( index - 1 ) < 0 ) ? l.length + ( index - 1 ): ( index - 1 )  ;
                                      });
                                    },
                                    child: SecondFeild( device_width , device_hight , 0 ) ,
                                  )
                              ),
                            ),
                            SizedBox(height: 15,),
                            Center(
                              child: Text( "TECHNOLOGIES WE ARE\n      WORKING WITH" ,
                                style: TextStyle(
                                    color: Color(0xffff0000) ,
                                    fontSize:  device_width / 20,
                                    fontWeight: FontWeight.w100,
                                    fontFamily: 'Merienda-Regular'
                                ),
                              ),
                            ) ,
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        hi = device_hight* 0.8 ;
                                        wi =device_width * 0.8 ;
                                        inc = 1 ;
                                      });
                                    },
                                    child: Container(
                                      width: 80 ,
                                      height: 100 ,
                                      child: Image(image: AssetImage("assets/images/t13.png")),
                                    ) ,
                                  ),
                                  SizedBox(width: 20,),
                                  Text("Java " , style: TextStyle(
                                      color: Color(0xff0019de) ,
                                      fontSize:  device_width / 22,
                                      fontWeight: FontWeight.w100,
                                      fontFamily: 'Merienda-Regular'
                                  ),)
                                ],
                              ),
                            ),

                            SizedBox(height: 30,),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Text(" C++" , style: TextStyle(
                                      color: Color(0xff0019de) ,
                                      fontSize:  device_width / 22,
                                      fontWeight: FontWeight.w100,
                                      fontFamily: 'Merienda-Regular'
                                  ),),
                                  SizedBox(width: 20,),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        hi = device_hight* 0.8 ;
                                        wi =device_width * 0.8 ;
                                        inc = 2 ;
                                      });
                                    },
                                    child: Container(
                                      width: 80 ,
                                      height: 100 ,
                                      child: Image(image: AssetImage("assets/images/t14.png")),
                                    ) ,
                                  )

                                ],
                              ),
                            ),
                            SizedBox(height: 30,),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        hi = device_hight* 0.8 ;
                                        wi =device_width * 0.8 ;
                                        inc = 3 ;
                                      });
                                    },
                                    child: Container(
                                      width: 80 ,
                                      height: 100 ,
                                      child: Image(image: AssetImage("assets/images/t15.png")),
                                    ) ,
                                  ),
                                  SizedBox(width: 20,),
                                  Text("pHp  " , style: TextStyle(
                                      color: Color(0xff0019de) ,
                                      fontSize:  device_width / 22,
                                      fontWeight: FontWeight.w100,
                                      fontFamily: 'Merienda-Regular'
                                  ),)
                                ],
                              ),
                            ),
                            SizedBox(height: 30,),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Text("Android" , style: TextStyle(
                                      color: Color(0xff0019de) ,
                                      fontSize:  device_width / 22,
                                      fontWeight: FontWeight.w100,
                                      fontFamily: 'Merienda-Regular'
                                  ),),
                                  SizedBox(width: 20,),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        hi = device_hight / 2 + device_hight / 4 ;
                                        wi =device_width * 0.8 ;
                                        inc = 4 ;
                                      });
                                    },

                                    child: Container(
                                      width: 80 ,
                                      height: 100 ,
                                      child: Image(image: AssetImage("assets/images/t16.png")),
                                    ) ,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                )
              ],
            ),
            OpenWidget( inc ,device_width - 100 , device_hight - 500 )
          ],
        ) ,
      )
    );
  }

  int inc = - 1 ;
}


class T {
  String img;
  String text;
  T ( this.img , this.text ) ;
}

List < T > l = [
  T( "assets/images/t6.png" , "We \nprovide \nService \nto Your \nProducts" ) ,
  T( "assets/images/t8.png" , "We \nprovide \nSecurity \nto our \nClint" ) ,
  T( "assets/images/t9.png" , "We \nhave \nArtificial \nIntelligence \nto Your \nProducts" ) ,
  T( "assets/images/t11.png" ,"We \nhave 10K + \nCostumer \nall Over \nWorld" ) ,
  T( "assets/images/t12.png" , "We \nhave \nOur \nCloud \nTechonology" )
] ;



class SecondFeild extends StatefulWidget {
  final double device_width;
  final double device_hight;
  final int index;

  SecondFeild(this.device_width, this.device_hight, this.index);

  @override
  State<SecondFeild> createState() => _SecondFeildState();
}

class _SecondFeildState extends State<SecondFeild> {
  late int currentIndex;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;
      timer = Timer.periodic(Duration(seconds: 3), (timer) {
        updateIndex((currentIndex + 1) % l.length);
      });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    timer?.cancel();
    super.dispose();
  }

  void updateIndex(int newIndex) {
    setState(() {
      currentIndex = newIndex;
      if( currentIndex == 0 ) {
        c1 = Color(0xff000e52) ;
        c2 = Colors.grey ;
        c5 = Colors.grey ;
      }
      else if( currentIndex == 2 ) {
        c3 = Color( 0xff000e52 ) ;
        c2 = Colors.grey ;
        c4 = Colors.grey ;
      }
      else if( currentIndex == 3 ) {
        c4 = Color( 0xff000e52 ) ;
        c5 = Colors.grey ;
        c3 = Colors.grey ;
      }
      else if( currentIndex == 4 ) {
        c5 = Color( 0xff000e52 ) ;
        c1 = Colors.grey ;
        c4 = Colors.grey ;
      }
      else if( currentIndex == 1 ) {
        c2 = Color( 0xff000e52 ) ;
        c3 = Colors.grey ;
        c1 = Colors.grey ;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          // Right drag detected
          updateIndex((currentIndex - 1) < 0 ? l.length - 1 : currentIndex - 1);
        } else if (details.primaryVelocity! < 0) {
          // Left drag detected
          updateIndex((currentIndex + 1) % l.length);
        }
      },
      child: Container(
        height: (widget.device_width > widget.device_hight)
            ? (widget.device_hight * 2) - 3
            : (widget.device_hight / 2.9) - 3,
        width: (widget.device_width - 30) - 3,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
        child: Column (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      int newIndex = (currentIndex - 1) < 0
                          ? l.length - 1
                          : currentIndex - 1;
                      updateIndex(newIndex);
                    });
                  },
                  icon: Icon(Icons.arrow_left_outlined),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                  children: [
                    Image.asset(
                      l[currentIndex].img,
                      width: widget.device_width / 3.2,
                      height: widget.device_width / 3.2,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      l[currentIndex].text,
                      style: TextStyle(
                        color: Color(0xfffa8383),
                        fontSize: (widget.device_width > widget.device_hight)
                            ? widget.device_width / 20
                            : widget.device_width / 20.9,
                        fontWeight: FontWeight.w100,
                        fontFamily: 'Merienda-Regular',
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    // Move to the next index
                    int newIndex = (currentIndex + 1) % l.length;
                    updateIndex(newIndex);
                  },
                  icon: Icon(Icons.arrow_right_outlined),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon( Icons.circle_sharp , color: c1, size: 5 ,) ,
                SizedBox(width: 3,),
                Icon( Icons.circle_sharp , color: c2,size: 5 ,) ,
                SizedBox(width: 3,),
                Icon( Icons.circle_sharp , color: c3,size: 5 ,) ,
                SizedBox(width: 3,),
                Icon( Icons.circle_sharp , color: c4,size: 5 ,) ,
                SizedBox(width: 3,),
                Icon( Icons.circle_sharp , color: c5,size: 5 ,) ,
              ],
            )
          ],
        )
      ) ,
    ) ;
  }
  Color c1 = Colors.grey ;
  Color c2 = Colors.grey ;
  Color c3 = Colors.grey ;
  Color c4 = Colors.grey ;
  Color c5 = Colors.grey ;
}


List < List < String > > details = [
  [ "JAVA" ,"Java is a versatile, object-oriented programming language known for its platform independence, allowing developers to write code once and run it anywhere using the Java Virtual Machine (JVM). It is widely used in web development, Android app development, enterprise systems, and big data tools due to its robustness, scalability, and extensive libraries. With features like automatic memory management, multithreading, and strong security, Java remains a popular choice for building reliable and secure applications across various domains" , "assets/images/t13.png"]  ,
] ;



class OpenWidget extends StatefulWidget {
  int n ; double w ,  h ;
  OpenWidget( this.n , this.w , this.h );

  @override
  State<OpenWidget> createState() => _OpenWidgetState();
}

class _OpenWidgetState extends State<OpenWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.only( top:10 ),
            child: AnimatedContainer(
              curve: Curves.easeInSine,
              duration: Duration( milliseconds:  300) ,
              height: hi,
              width: hi ,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xfff60000) ,
                ),
            ))
    ) ;
  }

}
double hi = 0 ;
double wi = 0 ;