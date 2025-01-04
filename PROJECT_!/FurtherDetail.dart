
import 'dart:io';
import 'dart:ui';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projects_flutter_1_1/PROJECT_!/Pro1.dart';




class FurtherDetail extends StatefulWidget {
  const FurtherDetail({super.key});


  @override
  State<FurtherDetail> createState() => _FurtherDetailState();
}


class _FurtherDetailState extends State<FurtherDetail> {
  File ? image;
  ImageProvider ? profilePhoto ;
  Future<void> galary() async {
    final ImagePicker pick = ImagePicker();
    final XFile ? file = await pick.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        image = File(file.path);
        profilePhoto = FileImage( image ! ) ;
      });
      // await addImage( image! , em! ) ;
    }

  }

  Future<void> camera() async {
    final ImagePicker p = ImagePicker();
    final XFile? x = await p.pickImage(source: ImageSource.camera);
    if (x != null) {
      setState(()  {
        image = File(x.path);
        profilePhoto = FileImage( image ! ) ;
      });
      // await addImage( image! , em! ) ;
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff031481),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer: Drawer(
        child: Padding(
          padding: EdgeInsets.only(top: 100, bottom: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: "C",
                    style: TextStyle(color: Colors.red, fontSize: 24), // Red
                    children: [
                      TextSpan(
                          text: 'O', style: TextStyle(color: Colors.orange)),
                      // Orange
                      TextSpan(text: 'L', style: TextStyle(color: Color(
                          0xffffdb00))),
                      // Yellow
                      TextSpan(
                          text: 'O', style: TextStyle(color: Colors.green)),
                      // Green
                      TextSpan(text: 'U', style: TextStyle(color: Colors.blue)),
                      // Blue
                      TextSpan(
                          text: 'R', style: TextStyle(color: Colors.indigo)),
                      // Indigo
                      TextSpan(
                          text: 'S', style: TextStyle(color: Colors.purple)),
                      // Violet
                    ],
                  ),
                ),
                SizedBox(height: 20,),

                Container(
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                      color: Color(0xff031481),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      image: DecorationImage(
                          image: AssetImage("assets/IMAGES/lo1.jpg"),
                          fit: BoxFit.cover)
                  ),
                ),
                SizedBox(height: 60,),
                ExpansionTileCard(
                  leading: CircleAvatar(
                    radius: 20,
                    // backgroundColor: Color(0xff031481),
                    backgroundImage: profilePhoto ?? imageNull() ,
                  ),
                  title: Text(
                    "Giri"
                      // '${loginData['firstName']} ${loginData['lastName']}'
                  ),
                  children: [

                    SizedBox(height: 20, ),
                    Stack(
                      children: [
                        SizedBox(height: 30,),
                        CircleAvatar(radius: 70, backgroundImage:  profilePhoto ?? imageNull() , ),

                        Positioned(
                          top: 95,
                          left: 90,

                          child:GestureDetector(
                            onTap: () {
                                alertCamAndGalery () ;
                            },
                            child: Container(
                              height:45,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(100) , topRight: Radius.circular(100) , bottomLeft: Radius.circular(100) , bottomRight: Radius.circular(62)  ),
                                  image: DecorationImage(  image: AssetImage("assets/IMAGES/pro11.jpg")  , fit: BoxFit.fill)
                              )
                            ),
                          )
                        ),
                        Positioned(
                          top: 90,
                          left: 115,
                          child: GestureDetector(
                            onTap: () {
                                alertCamAndGalery () ;
                            },
                            // child : Container(
                            //   height: 20,
                            //   width: 20,
                            //   decoration: BoxDecoration(
                            //     image: DecorationImage(image: AssetImage("assets/IMAGES/plus.jpg")),
                            //     borderRadius: BorderRadius.all(Radius.circular(100)),
                            //     color: Color(0xffff0000) ,
                            //   ),
                            // )
                          ),

                        ),
                      ]
                    ),
                    SizedBox(height: 30,),


                  ],
                ),
                SizedBox(height: 40,),
                ListTile(
                  onTap: () {
                    setState(() {
                      // settingDialog() ;
                    });
                  },
                  leading: Icon(Icons.settings),
                  title: Text("SETTINGS", style: TextStyle(
                      color: Color(0xff031481)
                  ),),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      loging.clear();
                      runApp(MaterialApp(
                          debugShowCheckedModeBanner: false,

                          home: LogIN()
                      ));
                    });
                  },
                  title: Text(
                    "LOGOUT", style: TextStyle(color: Color(0xff031481)),),
                  leading: Icon(Icons.logout),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  AssetImage imageNull() {
    print ( 1234567) ;
    print(12345678) ;
    // if ( loginData[ 'gender' ] == 'MALE'  )
    //   return AssetImage("assets/IMAGES/m1.jpg");
    // else
      return AssetImage("assets/IMAGES/fff2.jpg");
  }

  void alertCamAndGalery() {
    showDialog(
      barrierDismissible: false ,
        barrierLabel: 'Dialog Background',
        barrierColor: Colors.transparent.withOpacity(0.6),
        context: context,
        builder: ( BuildContext context ) {
          return Stack(
            children: [

              AlertDialog(
                backgroundColor: Colors.grey,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text( "UPDATE PROFILE PHOTO" ,style: TextStyle(
                        color: Color(0xff031481) , fontSize: 18
                    ),),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child : Icon( Icons.close , size: 25, )
                      )
                  ]

                ),

                actions: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: camera ,
                        child:Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(1000)),
                                  image: DecorationImage(
                                      image: AssetImage("assets/IMAGES/cam1.jpg")
                                  )
                              ),
                            ) ,
                            Text("  TAKE \n  PHOTO ON \n  CAMERA") ,
                          ] ,
                        ) ,
                      ) ,
                      SizedBox(width: 40,),
                      GestureDetector(
                          onTap: galary ,
                          child:Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(1000)),
                                    image: DecorationImage(
                                        image: AssetImage("assets/IMAGES/gal.png")
                                    )
                                ),
                              ) ,
                              Text("  CHOOSE \n  FROM THE \n  DEVICES") ,
                            ],
                          ),



                      ) ,
                    ],
                  ),

                  SizedBox(height: 30,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff031481)
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }, child: Text("SET PROFILE PHOTO" , style:  TextStyle( fontSize: 10 , color:  Color(0xffffffff)),)
                  )
                ],
              )
            ],
          );
        }
    ) ;
  }
}