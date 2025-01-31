
import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'Let_See_my_Profile/Contact.dart';
import 'Let_See_my_Profile/Education.dart';
import 'Let_See_my_Profile/Email.dart';
import 'Let_See_my_Profile/Texhnologies.dart';
import 'Let_See_my_Profile/ValueNotifier.dart';
import 'Let_See_my_Profile/resume.dart';
import 'OpenPage.dart';



class Swipeupanddown extends StatefulWidget {
  Swipeupanddown({super.key , required this.value , required this.swipe , required this.vn });
  final double value ;
  final ValueNotifier vn ;
  final ValueNotifier swipe ;
  @override
  State<Swipeupanddown> createState() => _SwipeupanddownState();
}

class _SwipeupanddownState extends State<Swipeupanddown> {
  @override
  Widget build(BuildContext context) {

    //! ------------------------------------
    final double width = MediaQuery.of(context).size.width ;
    final double height = MediaQuery.of(context).size.height ;
    //! ------------------------------------



    return Container(    //! SWIPE UP DETAILS >>>> 
      height: widget.value,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 0, 247, 255) ,    
            Color.fromARGB(255, 0, 224, 231) ,    
            Color.fromARGB(255, 0, 179, 185) ,    
            Color.fromARGB(255, 0, 135, 139) ,    
            Color.fromARGB(255, 0, 105, 109) ,    
            Color.fromARGB(255, 0, 81, 83) ,                
            Color.fromARGB(255, 0, 58, 59) ,
          ] ,
          begin: Alignment.topLeft ,
          end: Alignment.bottomRight ,
        )
      ),
    
      child: SingleChildScrollView(
        child: ( widget.value == height - (height / 20)) ?Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox( height:   ( height > width ) ? height / 20 : ( 2 * height < width) ? height / 5 : height / 6 ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox( width: width / 10 ,),
                  IconButton(
                    onPressed: (){
                      setState(() {
                        WidgetsBinding.instance.addPostFrameCallback(
                          (_) {
                            swipeUP.value= 0;
                            widget.vn.value = false ;
                          }
                        );
                      });
                    } ,
                    icon: Icon( Icons.clear , size: ( height < width ) ? height / 10 : 30 , color: const Color.fromARGB(255, 0, 0, 0), )
                  ),
                  
                  SizedBox( width: width / 18 ,  ),
                  containerClass.space( height , width, context ),
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText(
                          "LET's SEE MY PROFILE" ,
                          textStyle: TextStyle( // ( width < MediaQuery.of(context).size.height ) ? 20 : ( ( 2.2 * width ) > MediaQuery.of(context).size.height  ) ? height / 12 : 100,
                            fontSize: ( width < MediaQuery.of(context).size.height ) ? 20 :  height / 12 ,
                            height: 0.3,
                            color:const Color.fromARGB(255, 76, 0, 255)  ,
                            fontFamily: 'h1',
                            letterSpacing: 1 ,
                              
                          ),
                        ),
                      ],
                      totalRepeatCount: pow(2, 53) - 1 as int ,
                    ),
                  ),
                ],
              ) ,
              containerClass.space( height , width, context ),

              //! ----------------------------  <1> ------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: [
                  containerClass.containerMethod( 2 ,width , context , "Education" , Education(), height ) ,
                  containerClass.lottieFiles( width , "assets/lotties/Education.json" , height) ,
                ],
              ),
              containerClass.space( height , width, context ),


              
              //! ----------------------------  <2> ------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: [
                  containerClass.lottieFiles(  width , "assets/lotties/Tech.json" , height) ,
                  containerClass.containerMethod(3, width , context , "Technologies" , Technologies() , height) ,
                ]
              ) ,
              containerClass.space( height , width, context ),

              
              //! ----------------------------  <3> ------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: [
                  containerClass.containerMethod( 4,width , context , "View Resumea" , Resumea(), height ) ,
                  containerClass.lottieFiles( width , "assets/lotties/Resumea.json", height ) ,
                ],
              ),
              containerClass.space( height , width, context ),

              
              //! ----------------------------  <4> ------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: [
                  containerClass.lottieFiles( width , "assets/lotties/ContactInfo.json" , height ) ,
                  containerClass.containerMethod( 5, width , context , "Contact Information" , Contact() , height ) ,
                ],
              ),
              containerClass.space( height , width, context ),
              
              //! ----------------------------  <5> ------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: [
                  containerClass.containerMethod( 6 ,width , context , "Let's Talk" , Email() , height  ) ,
                  containerClass.lottieFiles( width , "assets/lotties/Email.json" , height ) ,
                ],
              ),
            ],
          ),
        ): SizedBox.shrink() ,
      ),
    );
  }
}




class containerClass {


  static SizedBox lottieFiles( double width , String file , double height ) {
    return SizedBox(
      height: ( height > width ) ? height / 10 : ( ( 2.2 * width ) > height  ) ? height / 3 : height / 5  ,
      width:  width - ( width / 1.5 ) ,
      // color: Colors.amber,
      child: Lottie.asset(file),
    ) ;
  }

  static SizedBox space( double height , double width , BuildContext c ) {
    return SizedBox( 
      height: ( height > width ) ? height / 20 : ( ( 2.2 * width ) > height  ) ? height / 3 : height / 5  ,
    ) ;
  }
  static Container containerMethod( int i , double width, BuildContext context , String text , dynamic redirect , double height ) {
    return Container(
      height: ( height > width ) ? height / 10 : ( ( 2.2 * width ) > height  ) ? height / 3 : height / 5  ,
      width: width - ( width / 2 ) ,
      decoration: BoxDecoration( 
        
        borderRadius: BorderRadius.all(Radius.circular( 20 )),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 37, 80, 83) ,
            blurRadius: 10 ,
            blurStyle: BlurStyle.normal,
            offset: Offset( 3, 3 ),
          )
        ], // const Color.fromARGB(255, 17, 83, 0).withOpacity(0.1),
        color: const Color.fromARGB(255, 0, 151, 156),
        border: Border.all( 
          width: 1 ,
          color: const Color.fromARGB(255, 0, 0, 0),
        )
      ),
      child: Center(
        child: Stack(
          children: [
            Center(
              child: TextButton(
                onPressed: () {
                  education.value = true ;
                    // Navigator.of(context).push(
                    //   MaterialPageRoute( 
                    //     builder: (context) => redirect ,
                    //   ) 
                    // ) ;
                },
                child: FittedBox( 
                  child: staticMethods.colorizedText(
                  text  ,
                  [
                    const Color.fromARGB(255, 18, 0, 48),
                    const Color.fromARGB(255, 0, 119, 133),
                    const Color.fromARGB(255, 0, 92, 104),
                    const Color.fromARGB(255, 0, 151, 156),
                    const Color.fromARGB(255, 0, 203, 218),
                    const Color.fromARGB(255, 93, 255, 228),
                  ] ,
                  'h3',
                  ( width < height ) ? 20 : ( ( 2.2 * width ) > height  ) ? 50 : 100  
                ),
                ) 
              )
            ) ,
            InkWell(
              onTap: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  // education.value = true ;
                  print('education.value , ${education.value} ');
                  swipeUP.value = i ;
                  vn.value = false ;
                  education.value = true ;

                
                });
                    // Navigator.of(context).push(
                    //   MaterialPageRoute( 
                    //     builder: (context) => redirect ,
                    //   ) 
                    // ) ;
              },
            ),
          ],
        )
      ) ,
    );
  }
}