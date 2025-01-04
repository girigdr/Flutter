
import 'package:flutter/material.dart';





class Pass extends StatefulWidget {
   String l ;
   String h ;
   Icon i ;
   Icon v ;
   TextEditingController t ;

   bool bo ;
   // Pass( { required this.l ,required this.h ,required this.i , required this.v , required this.bo } ) ;

   C() {
     return t.text ;
   }
   Pass( this.t , this.l, this.h, this.i, this.v, this.bo );

  @override
  State<Pass> createState() => _PassState();
}





class _PassState extends State<Pass> {

  @override
  Widget build(BuildContext context) {

    //"CONFIRM PASSWORD" , "ENTER PASSWORD AGAIN " ,Icon( Icons.lock ) , Icon( Icons.visibility ), true ) ,
    return TextField(
      controller: widget.t ,
      obscureText: widget.bo,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffff0000)),
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff031481)),
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        prefixIcon: widget.i,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              if( widget.bo ) {
                widget.bo = false ;
                widget.v = Icon( Icons.visibility_off) ;
              }
              else {
                widget.bo = true ;
                widget.v = Icon( Icons.visibility) ;
              }
            });


          },
          icon: widget.v ,
        ),
        prefixIconColor:  Color(0xff031481) ,
        labelText: widget.l ,
        hintText: widget.h ,
      ),
    ) ;
  }

}



