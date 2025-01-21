import 'dart:convert';
import 'dart:math';
import 'package:lottie/lottie.dart' ;
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart' ;

class OpenPage extends StatefulWidget {
  const OpenPage({super.key});

  @override
  State<OpenPage> createState() => OpenPageState();
}

class OpenPageState extends State<OpenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all( 10 ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 400,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                          image: AssetImage("assets/images/—Pngtree—3d cute cartoon male teacher_14745699.png")
                      )
                    ),
                  ),
                  Text(
                    "Hiii",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 252, 135, 135)
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



class OpenPage1 extends StatefulWidget {
  const OpenPage1({super.key});

  @override
  State<OpenPage1> createState() => _OpenPage1State();
}

class _OpenPage1State extends State<OpenPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomPaint(
                painter: BorderPainter() ,
                child: ClipPath(
                  clipper: DiagonalClipper() ,
                  child: TweenAnimationBuilder(
                    curve: Curves.easeInOut,
                    tween: Tween < double > ( begin: 0 , end: 370 ),
                    duration: Duration( milliseconds: 700 ), 
                    builder: (context, value, child) {
                      return containerUp( value ) ;
                    },
                  ),
                ),
              ),
              SizedBox( height: 5 ,) ,
              TweenAnimationBuilder(
                duration: Duration( milliseconds: 700 ) ,
                curve: Curves.easeInOut,
                tween: Tween < double > (begin: 0 , end:  370 ) ,
                builder : (context, value, child) {
                  return containerDown( value ) ;
                },
                
              )
              
            ],
          ),
        ),
      )
    );
  }
  WavyAnimatedText nameLetter( String l ) {
    return WavyAnimatedText(
      l ,
      textStyle: TextStyle(
        fontSize: 17,
        height: 0.3,
        color: Color.fromARGB(255, 0, 204, 255).withOpacity(0.8) ,
      ),
    );                        
  }

  Container containerUp ( double h ) {
    return Container(
      height: h,
      width: 320,
      decoration: BoxDecoration(
        // border: Border.all(
        //   color: const Color.fromARGB(255, 255, 230, 0) ,
        //   width: 2 
        // )
        
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox( height: 100,) ,
              Text( 
                "HII..." ,
                style:  TextStyle(
                  fontFamily: "h1" ,
                  fontSize: 35 ,
                  color: const Color.fromARGB(255, 255, 255, 255),
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
  Container containerDown ( double h ) {
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
                height: 280,
                width: 280,
                decoration: BoxDecoration(
                  image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/images/—Pngtree—3d cute cartoon male teacher_14745699.png"))
                ),
              ) ,
              AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    'GIRIDHARAN   RAVI' ,
                    colors: [
                      Colors.purple,
                      Colors.blue,
                      Colors.yellow,
                      Colors.red,
                    ] ,
                    textStyle: TextStyle(
                      fontSize: 27,
                    )
                  ) ,
                ],
                totalRepeatCount: pow(2, 53) - 1 as int ,
                // isRepeatingAnimation: true ,
                // stopPauseOnTap: false ,
              ),
              SizedBox( height: 10,) ,
              AnimatedTextKit(
                animatedTexts: [
                  nameLetter("SOFTWARE ENGINEER")
                ],
                // stopPauseOnTap: false ,
                // isRepeatingAnimation: true,
                totalRepeatCount: pow(2, 53) - 1 as int ,
              ),
            ],
          ),
        ),
      ),
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
