import 'package:flutter/material.dart';


TextEditingController _controllerFirstName = TextEditingController() ;
TextEditingController _controllerLastName = TextEditingController() ;

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: App() ,
    )
  ) ;
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  Color TransColor_ =  Colors.transparent;
  Color TextFeildColor_ =  Colors.transparent ;
  double hight_ = 0 ;
  double width_ = 0 ;
  Color color_ = Color(0xff3a2626) ;
  bool b = false ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
              right: 200,
              child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      if( hight_ == 0 && width_ == 0 ){
                        hight_ = 750;
                        width_ = 350;
                      }
                      else if( hight_ == 750 && width_ == 350 ){
                        b = false ;
                        hight_ =0 ;
                        width_ = 0;
                      }
                    });
                  },
                  child: Text( "click me")
              ),
          ),

          Center(
            child: AnimatedContainer(
              onEnd: () {
                setState(() {
                  // Show widgets only when the animation completes
                  b = hight_ == 750 && width_ == 350;
                });
              },
              duration: Duration(milliseconds: 270),
              height: hight_,
              width: width_,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(4, 4) ,
                    blurRadius: 15 ,
                    color: Color(0xff593959)
                  ),
                ],
                color: color_
              ),
              curve: Curves.linearToEaseOut,
              child: (b) ? Padding(
                padding: EdgeInsets.all(40) ,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 30 ),
                          Text(
                            "LOGIN" ,
                            style: TextStyle(
                                color: Color(0xff84d7d1) ,
                                fontSize: 20 ,
                                fontWeight: FontWeight.w100
                            ),
                          ) ,
                          SizedBox(height: 30 ),
                          TEXT_FEILD_METHOD(_controllerFirstName, "GMAIL", "ENTER YOUR GMAIL" , true ) ,
                          SizedBox(height: 30 ),
                          TEXT_FEILD_METHOD(_controllerLastName, "PASSWORD", "ENTER YOUR PASSWORD" , false ) ,
                          SizedBox(height: 30 ),
                          GestureDetector(
                            onTap: () {

                            } ,
                            child: Container(
                              height: 49,
                              width: double.infinity,
                              child: Center(
                                  child: Text("LOGIN")
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                color: Color(0xff84d7d1)
                              ),
                            ) ,
                          )
                        ],
                      ),
                    )
                  ),
              ) : null ,
            )
          )
        ]
      )
    );
  }
}




class TEXT_FEILD_METHOD extends StatefulWidget {
  TextEditingController controller ;
  String l_name ;
  String h_name ;
  bool i ;
  TEXT_FEILD_METHOD( this.controller , this.l_name , this.h_name , this.i );

  @override
  State<TEXT_FEILD_METHOD> createState() => _TEXT_FEILD_METHODState();
}

class _TEXT_FEILD_METHODState extends State<TEXT_FEILD_METHOD> {
  bool passwordVisiblity = true ;
  IconData iconsPassVisiblity = Icons.visibility ;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Color(0xff84d7d1) ,
        fontWeight: FontWeight.w200,
        fontSize: 15
      ),
      controller: widget.controller,
      obscureText: ( !widget.i ) ? passwordVisiblity : false ,
      decoration: InputDecoration(
        labelText: widget.l_name,
        labelStyle: TextStyle(
            color: Color(0xff446563)
        ),
        hintText: widget.h_name ,
        hintStyle: TextStyle(
            color: Color(0xff446563)
        ),
        suffixIcon : ( !widget.i ) ? IconButton(
          onPressed: () {
            setState(() {
              if( passwordVisiblity ) {
                passwordVisiblity = false ;
                iconsPassVisiblity = Icons.visibility_off ;
              }
              else {
                passwordVisiblity = true ;
                iconsPassVisiblity = Icons.visibility ;
              }
            });
          },
          icon: Icon( iconsPassVisiblity , color:  Color(0xffab7e7e),) ,
        ) : null ,

        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            borderSide: BorderSide( color: Color(0xff84d7d1) ),
        ) ,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            borderSide: BorderSide( color: Color(0xff84d7d1) )
        )
      )
    );
  }
}
