import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
void main () {
  runApp (
    MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: T () ,
    )
  ) ;
}

class T extends StatefulWidget {
  const T({super.key});

  @override
  State<T> createState() => _TState();




}

class _TState extends State<T> {
  final key =  GlobalKey < _TState > ()  ;
  void up(Color color) {
    setState(() {
      iconColor = color ;
    });
  }

  void threeDot123() {
    height_ThreeDot = 0 ;
    width_ThreeDot = 0 ;
    color_ThreeDot = Colors.black ;
    threeDot = false ;
  }
  double height_ThreeDot = 0 ;
  double width_ThreeDot = 0 ;
  Color color_ThreeDot = Colors.black ;
  bool threeDot = false ;
  Color iconColor = Colors.transparent ;
  void closeThreeIconButton() {

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              setState(() {
                height_ThreeDot = 0 ;
                width_ThreeDot = 0 ;
                color_ThreeDot = Colors.black ;
                threeDot = false ;

              });
            },
          ) ,
          Padding(
            padding: EdgeInsets.only( top: 7.6 , left: 2 , right: 2 , bottom: 10) ,
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 30,) ,
                      Stack(
                        children: [
                          Positioned(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  threeDot123() ;
                                });
                              },
                              child: Container(
                                height: 200,
                                width: 500,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/z123.jpg"),
                                      fit: BoxFit.cover
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                threeDot123() ;
                              });
                            },
                            child: A_C1() ,
                          ) ,

                          Positioned(
                            top: 30 , left: 20 ,
                            child: GestureDetector(
                              child: Tw(),
                              onTap: () {
                                setState(() {
                                  threeDot123() ;
                                });
                              },
                            ) ,
                          ) ,
                          if( ! tsf )
                            Positioned(
                              top: 52 , left: 280 ,
                              child: TweenAnimationBuilder(
                                  duration: Duration(milliseconds: 1100) ,
                                  tween: ColorTween(begin: Colors.transparent , end: iconColor ),
                                  builder: ( BuildContext co , Color ? c , Widget ? child ) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                tsf = true ;
                                                threeDot123();
                                              });
                                            },
                                            icon: Icon(Icons.search_off_outlined, color: c,)
                                        ),
                                        IconButton(
                                            onPressed: (){
                                              camera();
                                              setState(() {
                                                threeDot123();
                                              });
                                            }
                                            , icon: Icon(Icons.camera_alt, color: c,)
                                        ) ,
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                if( height_ThreeDot == 0 ) {
                                                  height_ThreeDot = 300  ;
                                                  width_ThreeDot = 200 ;
                                                }
                                                else {
                                                  height_ThreeDot = 0  ;
                                                  width_ThreeDot = 0 ;
                                                  threeDot = false ;
                                                }
                                                color_ThreeDot = (color_ThreeDot == Colors.black ) ? Colors.red : Colors.black ;
                                              });
                                            } ,
                                            icon: Icon(Icons.more_vert ,color: c, )
                                        )
                                      ],
                                    );
                                  }
                              ) ,
                            ),
                        ],
                      ),

                    ],
                  ),
                  Positioned(
                    right: 20,
                    top: 134 ,
                    child: AnimatedContainer(
                      onEnd: () {
                        setState(() {

                          threeDot = height_ThreeDot == 300 && width_ThreeDot == 200 ;
                        });
                      },
                      duration: Duration(
                          milliseconds: 300
                      ) ,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: color_ThreeDot.withOpacity(0.7),
                      ),
                      width: width_ThreeDot,
                      height: height_ThreeDot,
                      curve: Curves.easeInOut,
                      child: Center(
                        child: ( threeDot ) ? SingleChildScrollView(
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.settings , color: Color(0xff29006b) ,),
                                title: Text("SETTING" , style:  TextStyle( color: Color(0xff29006b) , fontWeight: FontWeight.w100 , fontSize: 16),),
                              ),
                              ListTile(
                                leading: Icon(Icons.message , color: Color(0xff29006b) ,),
                                title: Text("MESSAGE" , style:  TextStyle( color: Color(0xff29006b) , fontWeight: FontWeight.w100 , fontSize: 16),),
                              ),
                              ListTile(
                                leading: Icon(Icons.person_add_alt_1 , color: Color(0xff29006b) ,),
                                title: Text("ADD FRIEND" , style:  TextStyle( color: Color(0xff29006b) , fontWeight: FontWeight.w100 , fontSize: 16),),
                              ),
                              ListTile(
                                leading: Icon(Icons.block_flipped , color: Color(0xff29006b) ,),
                                title: Text("BLOCK" , style:  TextStyle( color: Color(0xff29006b) , fontWeight: FontWeight.w100 , fontSize: 16),),
                              ) ,
                              ListTile(
                                leading: Icon(Icons.account_box , color: Color(0xff29006b) ,),
                                title: Text("ACCOUNT" , style:  TextStyle( color: Color(0xff29006b) , fontWeight: FontWeight.w100 , fontSize: 16),),
                              ) ,
                              ListTile(
                                leading: Icon(Icons.account_balance , color: Color(0xff29006b) ,),
                                title: Text("PAYMENT" , style:  TextStyle( color: Color(0xff29006b) , fontWeight: FontWeight.w100 , fontSize: 16),),
                              ),
                            ],
                          ),
                        ) : null ,
                      ),
                    ),
                  )
                ],
              ),
            )
        ],
      )
    );
  }
  File ? file ;
  ImageProvider ? image ;
  Future< void > camera () async {

    final ImagePicker p = ImagePicker() ;
    final  XFile? xf = await p.pickImage(source: ImageSource.camera ) ;
    if( xf != null ){
      setState(() {
        file = File(xf.path) ;
        image = FileImage(file!) ;
      });
    }


  }
}


TextEditingController search = TextEditingController() ;



class A_C1 extends StatefulWidget {
  const A_C1({super.key});

  @override
  State<A_C1> createState() => _A_C1State();
}

class _A_C1State extends State<A_C1> {
  Color _color = Color(0xfffdadad) ;
  double h = 0 ;
  double w = 0 ;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      w_h() ;
    }) ;
  }
  void w_h() {
   setState(() {
     w = 500 ;
     h = 100 ;
     _color = Color(0xffffffff).withOpacity(0.4 ) ;

   });
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.linearToEaseOut,
      duration: Duration(milliseconds: 500 ) ,
      height: h ,
      width: w ,
      decoration: BoxDecoration(
        color: _color ,
      ),
    );
  }


}

bool tsf = false ;
class Tw extends StatefulWidget {
  const Tw( {super.key} );

  @override
  State<Tw> createState() => _TwState();
}

class _TwState extends State<Tw> {
  @override
  Widget build(BuildContext context) {
    return
      ( !tsf ) ? TweenAnimationBuilder(
          onEnd: () {
            setState(() {
              final p = context.findAncestorStateOfType<_TState>();
              p?.up( Color(0xff29006b) );
            });
          },
          tween: Tween<double> (begin: 0 , end:  1 ),
          duration: Duration( milliseconds: 1000 ) ,
          child: Text ( "W E L C O M E" ,  style: TextStyle( color: Color(
              0xff29006b) , fontSize: 25 ),),
          builder: ( BuildContext context , double val , Widget? child ) {
            return Opacity(
                opacity: val,
                child: Padding(
                  padding: EdgeInsets.only( top: val* 30 , left: val * 20 ) ,
                  child: child ,
                )
            ) ;
          }
      ):Column(
            children: [
              SizedBox(height: 20,) ,
              Row(
                children: [
                  SizedBox(width: 10 ,),
                  AnimatedContainer(
                      duration: Duration( milliseconds: 500),
                      height: 40,
                      width: 180,
                      decoration: BoxDecoration(
                      ),
                      child: TextField(
                        controller: search,
                        decoration: InputDecoration(
                          // Setting the border color
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff29006b)), // Border when not focused
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff29006b), width: 2.0), // Border when focused
                          ),
                          // Hint text styling
                          hintStyle: TextStyle(fontSize: 15 , color: Color(0xff29006b) , fontWeight: FontWeight.w100),
                          hintText: "   SEARCH",
                        ),
                      )
                  ) ,
                  IconButton(
                    onPressed: () {
                      setState(() {
                        tsf = false;
                      });
                    },
                    icon: Icon(Icons.search_off_outlined , size: 20,color: Color(0xff29006b), ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tsf = false;
                      });
                    },
                    child: Text( "SEARCH" , ),
                  ) ,
                  IconButton(
                    onPressed: () {
                      setState(() {
                        tsf = false;
                      });
                    },
                    icon: Icon(Icons.close ,size: 20, color: Color(0xff29006b),),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tsf = false;
                      });
                    },
                    child: Text( "CLOSE" ),
                  ) ,

                ],
              )
            ],
          );
  }
}
