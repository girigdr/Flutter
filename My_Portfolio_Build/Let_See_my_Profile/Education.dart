
import 'dart:math';
import 'package:flutter/material.dart';

import 'ValueNotifier.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:animated_text_kit/animated_text_kit.dart';





class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  int currentPage =  0 ;
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
      body: Padding(
        padding: EdgeInsets.all( ( height > width ) ? width / 10 : height / 10 ),
        child: PageView(
          onPageChanged: ( index ) {
            setState(() {
              currentPage = index ;
            });
          },
          children: [
              currentPage == 0 ? TweenAnimationBuilder(
                tween: Tween < double > ( begin: 0 , end: height ),
              curve: Curves.decelerate ,
              duration: Duration( milliseconds: 500 ), 
                builder: (context, value, child) {
                  return Center(
                    child: Container(
                      decoration: BoxDecoration(
                      border: Border.all(
                        width: 1 , 
                        color: const Color.fromARGB(255, 137, 19, 192),
                      )
                    ),
                      height: value ,
                      width:  width ,
                    ),
                  );
                }
              ) : SizedBox(),
              currentPage == 1 ? TweenAnimationBuilder(
                tween: Tween < double > ( begin: 0 , end: height ),
              curve: Curves.decelerate ,
              duration: Duration( milliseconds: 500 ), 
                builder: (context, value, child) {
                  return Center(
                    child: Container(
                      decoration: BoxDecoration(
                      border: Border.all(
                        width: 1 , 
                        color: const Color.fromARGB(255, 137, 19, 192),
                      )
                    ),
                      height: value ,
                      width:  width ,
                    ),
                  );
                }
              ) : SizedBox(),
            
          ],
        ),
      ),
    );
  }
}






















// class Education extends StatefulWidget {
//   const Education({super.key});

//   @override
//   State<Education> createState() => _EducationState();
// }

// class _EducationState extends State<Education> {



  


//   @override
//   Widget build(BuildContext context) {

    
//     //! ------------------------------------
//     final double width = MediaQuery.of(context).size.width ;
//     final double height = MediaQuery.of(context).size.height ;
//     //! ------------------------------------


//     final double headingSize = ( width < height ) ? height / 20  : height / 10 ;
//     return ValueListenableBuilder(
//       valueListenable: swipeUP , 
//       builder: (context, value, child) {
//             // final double headingSize = ( width < height ) ? 30 : ( ( 2.2 * width ) > height  ) ? 60 : 110 ;
//         if( value == 2 ) {
//           return TweenAnimationBuilder(
//             tween: Tween< double > ( begin: 0 , end: height - (height / 20) ), 
//             duration: Duration( milliseconds: 300 ), 
//             curve: Curves.decelerate,
//             builder: (context, value, child) {
//               return Stack(
//                 children: [
//                   Positioned(
//                     bottom: 0 ,
//                     left:  0 ,
//                     right:  0 ,
//                     child: Container(
//                       height: value ,
//                       width: width,
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                           colors: [
//                             Color.fromARGB(255, 0, 247, 255) ,    
//                             Color.fromARGB(255, 0, 224, 231) ,    
//                             Color.fromARGB(255, 0, 179, 185) ,    
//                             Color.fromARGB(255, 0, 135, 139) ,    
//                             Color.fromARGB(255, 0, 105, 109) ,    
//                             Color.fromARGB(255, 0, 81, 83) ,                
//                             Color.fromARGB(255, 0, 58, 59) ,
//                           ]
//                         ),
//                         borderRadius: BorderRadius.all(Radius.circular(25)) 
//                       ),
//                       child: ( value == height - (height / 20) ) ? SingleChildScrollView(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             // SizedBox(
//                             //   height: ( height > width ) ? height / 20 : ( 2 * height < width) ? height / 5 : height / 6 ,
//                             // ),
//                             //!--------------------------------------
//                               SizedBox( height:   ( height > width ) ? height / 20 : ( 2 * height < width) ? height / 5 : height / 6 ,),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   SizedBox( width: width / 10 ,),
//                                   IconButton(
//                                     onPressed: (){
//                                       setState(() {
//                                         WidgetsBinding.instance.addPostFrameCallback(
//                                           (_) {
//                                             swipeUP.value = 0 ;
//                                             // vn.value = false   ;
//                                             iconToShowFurtherDetailOfEducation1.value = false;
//                                             iconToShowFurtherDetailOfEducation2.value = false;
//                                             iconToShowFurtherDetailOfEducation3.value = false;
//                                             education.value = false ;
//                                           }
//                                         );
                                        
//                                       });
//                                     } ,
//                                     icon: Icon( Icons.clear , size: ( height < width ) ? height / 10 : 30 , color: const Color.fromARGB(255, 0, 0, 0), )
//                                   ),
//                                   SizedBox( width: width / 18 ,  ),
//                                 ]
//                               ) ,
                                          
                        
//                             //!==================================
//                             FittedBox(
//                               child: AnimatedTextKit(
//                                 animatedTexts: [
//                                   WavyAnimatedText(
//                                     "EDUCATION" ,
//                                     textStyle: TextStyle( // ( width < MediaQuery.of(context).size.height ) ? 20 : ( ( 2.2 * width ) > MediaQuery.of(context).size.height  ) ? height / 12 : 100,
//                                       fontSize: ( width < height ) ? 30 : ( ( 2.2 * width ) > height  ) ? 60 : 110 ,
//                                       height: 0.3,
//                                       color:const Color.fromARGB(255, 76, 0, 255)  ,
//                                       fontFamily: 'h1',
//                                       letterSpacing: 1 ,
                                        
//                                     ),
//                                   ),
//                                 ],
//                                 totalRepeatCount: pow(2, 53) - 1 as int ,
//                               ),
//                             ),
                                  
//                             // DEGREE
//                             SizedBox( height:( height > width ) ? height / 20 : ( 2 * height < width) ? height / 5 : height / 6 ,),
//                             staticContainerForEducation.educationDetails(  height , width , "BACHELOR's" , 1  ) ,
//                             SizedBox( height:( height > width ) ? height / 20 : ( 2 * height < width) ? height / 5 : height / 6 ,),
//                             staticContainerForEducation.detailOfEachEducation(  height ,  width , iconToShowFurtherDetailOfEducation1 , 0 ),
//                             staticContainerForEducation.educationDetails(  height , width , "GRADE 12" , 2 ) ,
//                             SizedBox( height:( height > width ) ? height / 20 : ( 2 * height < width) ? height / 5 : height / 6 ,),
//                             staticContainerForEducation.detailOfEachEducation(  height ,  width , iconToShowFurtherDetailOfEducation2  , 1 ),
//                             staticContainerForEducation.educationDetails(  height , width , "GRADE 10" , 3 ) ,
//                             SizedBox( height:( height > width ) ? height / 20 : ( 2 * height < width) ? height / 5 : height / 6 ,),
//                             staticContainerForEducation.detailOfEachEducation(  height ,  width , iconToShowFurtherDetailOfEducation3  , 2 ),
//                             SizedBox( height:( height > width ) ? height / 20 : ( 2 * height < width) ? height / 5 : height / 6 ,),
//                             SizedBox( height:( height > width ) ? height / 20 : ( 2 * height < width) ? height / 5 : height / 6 ,),
//                           ],
//                         ),
//                       ) : SizedBox.shrink(),
//                     ),
//                   ),
//                 ],
//               ) ;
//             },
//           );
//         }
//         else {
//           return SizedBox.shrink() ;
//         }
//       },
//     ) ;
//   }
// }

// // ignore: camel_case_types
// class staticContainerForEducation{


//   static AnimatedTextKit colorizedText( String text , List< Color > c , String family ,  double size ) {
//     return AnimatedTextKit(
//       animatedTexts: [
//         ColorizeAnimatedText(
//           text ,
//           colors: c ,
//           textStyle: TextStyle(
//             fontSize: size ,
//             fontFamily: family ,
//           )
//         ) ,
//       ],
//       repeatForever: true ,
//       // totalRepeatCount: pow(2, 53) - 1 as int ,
//     );
//   }

//   static Center educationDetails( double height , double width , String text , int i ) {
//     return Center(
//       child: Container(
//         height: ( height > width ) ? height / 10 : ( 2 * height < width) ? height / 4 : height / 6 ,
//         width: width - width / 5 ,
//         decoration: BoxDecoration( 
        
//           borderRadius: BorderRadius.all(Radius.circular( 40 )),
//           boxShadow: [
//             BoxShadow(
//               color: const Color.fromARGB(255, 37, 80, 83) ,
//               blurRadius: 10 ,
//               blurStyle: BlurStyle.normal,
//               offset: Offset( 3, 3 ),
//             )
//           ], // const Color.fromARGB(255, 17, 83, 0).withOpacity(0.1),
//           color: const Color.fromARGB(255, 0, 151, 156),
//           border: Border.all( 
//             width: 1 ,
//             color: const Color.fromARGB(255, 0, 0, 0),
//           )
//         ),
//         child: Stack(
//           children: [
//             Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   FittedBox(
//                     child: staticContainerForEducation.colorizedText(
//                       //  ,
//                       text ,
//                       [
//                         const Color.fromARGB(255, 18, 0, 48),
//                         const Color.fromARGB(255, 0, 119, 133),
//                         const Color.fromARGB(255, 0, 92, 104),
//                         const Color.fromARGB(255, 0, 151, 156),
//                         const Color.fromARGB(255, 0, 203, 218),
//                         const Color.fromARGB(255, 93, 255, 228),
//                     ],
//                     'h3' ,
//                     ( width < height ) ? 25 : ( ( 2.2 * width ) > height  ) ? 55 : 100
                  
//                     ),
//                   ),
//                   SizedBox(width: 20,) ,
//                   FittedBox(
//                     child: ValueListenableBuilder(
//                       valueListenable: ( i == 1 ) ? iconToShowFurtherDetailOfEducation1 : ( i == 2 ) ? iconToShowFurtherDetailOfEducation2 : iconToShowFurtherDetailOfEducation3, 
//                       builder: (context, value, child) {
//                         if( value ) {
//                           return Icon( Icons.arrow_drop_up ,color: const Color.fromARGB(255, 0, 0, 0), size: ( width < height ) ? 35 : ( ( 2.2 * width ) > height  ) ? 55 : 100 ,) ;
//                         } else {
//                           return Icon( Icons.arrow_drop_down , color: const Color.fromARGB(255, 0, 0, 0), size: ( width < height ) ? 35 : ( ( 2.2 * width ) > height  ) ? 55 : 100  , ) ;
//                         }
//                       },
//                     ),
//                   ) ,
//                 ],
//               ),
//             ),
//             Center( 
//               child: InkWell(
//                 onTap: () {
//                   WidgetsBinding.instance.addPostFrameCallback((_) {
//                     if( 1 == i ) iconToShowFurtherDetailOfEducation1.value = !iconToShowFurtherDetailOfEducation1.value ;
//                     if( 2 == i )  iconToShowFurtherDetailOfEducation2.value = !iconToShowFurtherDetailOfEducation2.value ;
//                     if( 3 == i )  iconToShowFurtherDetailOfEducation3.value = !iconToShowFurtherDetailOfEducation3.value;
                    
//                   });
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     ) ;
//   }


//   static detailOfEachEducation( double height , double width , ValueNotifier i , int ii ) {
//     return ValueListenableBuilder(
//       valueListenable: i, 
//       builder: (context, value, child) {
//         if( i.value ) {
//           return Column(
//             children: [
//               TweenAnimationBuilder(
//                 curve: Curves.decelerate,
//                 tween: Tween <double> ( begin: 0 , end:  ( height > width ) ? height / 2 : ( 2 * height < width) ? height * 1.5 : height / 1.5 ,), 
//                 duration: Duration(milliseconds: 400),
//                 builder: (context, value, child) {
//                   return Container(
//                     height: value ,
//                     width: width - width / 5 ,
//                     decoration: BoxDecoration( 
        
//                       borderRadius: BorderRadius.all(Radius.circular( 50 )),
//                       boxShadow: [
//                         BoxShadow(
//                           color: const Color.fromARGB(255, 37, 80, 83) ,
//                           blurRadius: 10 ,
//                           blurStyle: BlurStyle.normal,
//                           offset: Offset( 3, 3 ),
//                         )
//                       ], // const Color.fromARGB(255, 17, 83, 0).withOpacity(0.1),
//                       color: const Color.fromARGB(255, 0, 151, 156),
//                       border: Border.all( 
//                         width: 1 ,
//                         color: const Color.fromARGB(255, 0, 0, 0),
//                       )
//                     ),
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           // SizedBox(height: ( height > width ) ? height / 15 : ( 2 * height < width) ? height / 3 : height / 5  ,),
//                           Container(
//                             height:  ( height > width ) ? height / 20 : ( 2 * height < width) ? height / 5 : height / 5 , 
//                             width: ( educationArray[ ii ][ 0 ].length < 15 ) ? width - width / 1.3 : width - width / 3,
//                             // color: Colors.green,
//                             child: FittedBox(
//                               child: Center(
//                                 child: AnimatedTextKit(
//                                   animatedTexts: [
//                                     nameLetter(educationArray[ ii ][ 0 ] , 'h3')
//                                   ],
//                                   repeatForever: true ,
//                                 )
//                               )
//                             ),
//                           ) ,
                          
                          
//                           // SizedBox(height: ( height > width ) ? height /35 : ( 2 * height < width) ? height / 6 : height /7  ,),
//                           Padding(
//                             padding: const EdgeInsets.all(20.0),
//                             child: Wrap(
//                               children: [
//                                 Center(
//                                   child: colorizedText(
//                                     educationArray[ ii ][ 1 ]   , 
//                                     [
//                                       const Color.fromARGB(255, 97, 0, 136),
//                                       const Color.fromARGB(255, 255, 0, 0),
//                                       const Color.fromARGB(255, 255, 251, 1),
//                                       const Color.fromARGB(255, 0, 255, 0),
//                                       const Color.fromARGB(255, 0, 60, 255),
//                                     ] ,
//                                     'h3' , 
//                                     ( height > width ) ? 20 : ( 2 * height < width) ? 50: 110
//                                     ),
//                                 ),
//                               ],
//                             ),
//                           ),
                          
                          
//                           // SizedBox(height: ( height > width ) ? height /35 : ( 2 * height < width) ? height / 5 : height /7  ,),
//                           Container(
//                             height: ( height > width ) ? height / 20 : ( 2 * height < width) ? height / 5 : height / 5 ,  
//                             width: width - width / 1.3,
//                             // color: Colors.green,
//                             child: FittedBox(
//                               child: Center(
//                                 child: AnimatedTextKit(
//                                   animatedTexts: [
//                                     nameLetter(educationArray[ ii ][ 2 ]  , 'h3')
//                                   ],
//                                   repeatForever: true ,
//                                 )
//                               )
//                             ),
//                           ) ,

                          
//                           Padding(
//                             padding: const EdgeInsets.all(20.0),
//                             child: Wrap(
//                               children: [
//                                 Center(
//                                   child: colorizedText(
//                                     educationArray[ ii ][ 3 ]  , 
//                                     [
//                                       const Color.fromARGB(255, 97, 0, 136),
//                                       const Color.fromARGB(255, 255, 0, 0),
//                                       const Color.fromARGB(255, 255, 251, 1),
//                                       const Color.fromARGB(255, 0, 255, 0),
//                                       const Color.fromARGB(255, 0, 60, 255),
//                                     ] ,
//                                     'h3' , 
//                                     ( height > width ) ? 20 : ( 2 * height < width) ? 50: 110
//                                     ),
//                                 ),
//                               ],
//                             ),
//                           ),
                                  


//                           Container(
//                             height: ( height > width ) ? height / 20 : ( 2 * height < width) ? height / 5 : height / 5 ,  
//                             width: width - width / 1.5,
//                             // color: Colors.green,
//                             child: FittedBox(
//                               child: Center(
//                                 child: AnimatedTextKit(
//                                   animatedTexts: [
//                                     nameLetter(educationArray[ ii ][ 4 ]  , 'h3')
//                                   ],
//                                   repeatForever: true ,
//                                 )
//                               )
//                             ),
//                           ) ,

//                           Container(
//                             height: ( height > width ) ? height / 11 : ( 2 * height < width) ? height / 2 : height / 5 , 
//                             width: width - width / 3,
//                             // color: Colors.green,
//                             child: Center(
//                                 child:colorizedText(
//                                   educationArray[ ii ][ 5 ]  , 
//                                   [
//                                     const Color.fromARGB(255, 97, 0, 136),
//                                     const Color.fromARGB(255, 255, 0, 0),
//                                     const Color.fromARGB(255, 255, 251, 1),
//                                     const Color.fromARGB(255, 0, 255, 0),
//                                     const Color.fromARGB(255, 0, 60, 255),
//                                   ] ,
//                                   'h3' , 
//                                   ( height > width ) ? 20 : ( 2 * height < width) ? 50: 110
//                                   ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ) ;
//                 },
//               ),
//               SizedBox( height:( height > width ) ? height / 20 : ( 2 * height < width) ? height / 5 : height / 6 ,),
//             ],
//           );
//         }
//         return SizedBox.shrink() ;
//       }
//     );
//   }

//   static WavyAnimatedText nameLetter( String l , String fam ) {
//     return WavyAnimatedText(
//       l ,
//       textStyle: TextStyle(
//         fontSize: 17,
//         height: 0.3,
//         color: Color.fromARGB(255, 50, 0, 97).withOpacity(0.8) ,
//         fontFamily: fam 
//       ),
//     );
//   }

  

// }

// List < List < String > > educationArray = [
//   ["BACHELOR OF ENGINEERING" , "Electronic and Communication Engineering" , "COLLEGE" , "Government College of Engineering , Thanjavur" , "PERCENTAGE" ,  "75.4 Percentage"  ] ,
//   ["GRADE XII" , "Mathematics | Physics | Chemistry | Biology" , "SCHOOL" , "Karthi Vidhyalaya Matric Higher Secondary School , Kumbakonam" , "PERCENTAGE" ,  "71.5 Percentage"  ] ,
//   ["GRADE X" , "Mathematics | science | SocialScience" , "SCHOOL" , "Christ The King Matric Higher Secondary School , Kumbakonam" , "PERCENTAGE" ,  "85.6 Percentage"  ],

// ] ; 