import 'dart:async';
import 'package:flutter/material.dart' ;
import 'FurtherDetail.dart';
import 'Methods__.dart';
import 'Pass.dart';
import 'ServerAPIs.dart';



List < Widget > previous = []  ; // going to previous or back ...
List < Widget > loging = [] ;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      ImageIcon_Opening()
  ) ;

  Timer( Duration( seconds: 1 ) , () {
    if( loging.isNotEmpty ) {
      runApp( loging[ 0 ]) ;
    }
    else runApp(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          home: M() ,
        )
      ) ;
    }
  ) ;
}

class ImageIcon_Opening extends StatelessWidget {
  const ImageIcon_Opening({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            height: 250 ,
            width: 250,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/IMAGES/lo1.jpg") , fit: BoxFit.cover) ,
              borderRadius: BorderRadius.all(Radius.circular(1000))
            ),
          ),
        )
      ),
    );
  }
}

class M extends StatefulWidget {
  const M({super.key});

  @override
  State<M> createState() => _MState();
}

class _MState extends State<M> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30) ,
            child:Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "WELCOME" ,
                    style: TextStyle(
                      color: Color(0xff031481) ,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ) ,
                  Container(
                    height: 150,
                    width: 150 ,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/IMAGES/lo1.jpg") , fit: BoxFit.cover ) ,
                        borderRadius: BorderRadius.all(Radius.circular(1000))
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ) ,
                  Text(
                    "LET's GET STARTED TODAY..." ,
                    style: TextStyle(
                        color: Color(0xff031481) ,
                        fontSize: 20
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ) ,
                  Text(
                    "ALL THE BEST FOR YOUR GREAT SUCCESS" ,
                    style: TextStyle(
                        color: Color(0xff031481) ,
                        fontSize: 20
                    ),
                  ) ,
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          previous.add( M() ) ;
                          runApp(
                              MaterialApp(
                                debugShowCheckedModeBanner: false ,
                                home: SignIn() ,
                              )
                          ) ;
                        });
                      },
                      style : ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(  vertical: 17 ) ,
                          backgroundColor: Color(0xff031481)
                      ) ,
                      child: Center(
                        child: Text(
                          "GET STARTED" ,
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              // fontSize: 17
                          ),
                        ),
                      )
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          previous.add( M() ) ;
                          runApp(
                              MaterialApp(
                                debugShowCheckedModeBanner: false ,
                                home: LogIN() ,
                              )
                          ) ;
                        });
                      },
                      style : ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(  vertical: 17 ) ,
                          backgroundColor: Color(0xff031481)
                      ) ,
                      child: Center(
                        child: Text(
                          "LOGIN" ,
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              // fontSize: 17
                          ),
                        ),
                      )
                  )

                ],
              ),
            ) ,
          )
        ),
      )
    ) ;
  }
}





final loginEmailController = TextEditingController();
final loginPassController = TextEditingController();
class LogIN extends StatefulWidget {
  const LogIN({super.key});

  @override
  State<LogIN> createState() => _LogInState();
}

bool b = true ;
Icon icon_eye = Icon(Icons.visibility) ;
class _LogInState extends State<LogIN> {

  Color gMailCorrectText = Colors.transparent ;
  Color passWordCorrectText = Colors.transparent ;
  bool Met() {
    return b ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff031481) ,
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            setState(() {
              runApp(
                  MaterialApp(
                    debugShowCheckedModeBanner: false,
                    home: M() ,
                  )
              ) ;
            });
          },
          icon: Icon(Icons.arrow_back ) ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all( 30 ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      // color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(1000)),
                      image: DecorationImage(
                          image : AssetImage(
                              "assets/IMAGES/lo1.jpg"
                          ),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                SizedBox(
                  height: 50,
                ),

                TextField(
                  // cursorColor: Colors.grey,
                  // keyboardType: TextInputType.emailAddress,
                  controller: loginEmailController ,
                  decoration: InputDecoration (
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all( Radius.circular(100))  ,
                    ) ,
                    hintText: "enter gmail"  ,
                    labelText: "GMAIL",
                    prefixIcon: Icon(Icons.mail) ,
                  ),
                ) ,
                Text(
                  "USER ID IS INCORRECT" ,
                  style: TextStyle(
                    color: gMailCorrectText
                  ),
                ) ,
                SizedBox(
                  height: 50,
                ),
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: Met(),
                  controller: loginPassController,
                  decoration: InputDecoration(

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all( Radius.circular( 100 ) ) ,
                    ) ,
                    hintText: "enter password",
                    labelText: "PASSWORD",
                    prefixIcon: Icon( Icons.lock ) ,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if( b ) {
                              b = false ;
                              icon_eye = Icon( Icons.visibility_off ) ;
                            }
                            else {
                              b = true ;
                              icon_eye = Icon( Icons.visibility ) ;
                            }
                          });
                        },
                        icon: icon_eye
                    ),
                  ),
                ) ,
                Text("PASSWORD IS INCORRECT" ,  style: TextStyle(
                    color: passWordCorrectText
                ),) ,
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    runApp(MaterialApp(
                      home: FurtherDetail(),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric( horizontal:  170 , vertical: 17 ) ,
                    backgroundColor:  Color(0xff031481) ,
                  ),
                  child: Center(
                    child: Text( "LOGIN" ,
                      style: TextStyle(
                          color: Color(0xffffffff) ,
                          fontWeight: FontWeight.bold ,
                          fontSize: 13
                      ),
                    ) ,
                  )

                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {

                          previous.add( LogIN() ) ;
                          runApp(
                            MaterialApp(
                              debugShowCheckedModeBanner: false,
                              home: SignIn() ,
                            )
                          ) ;
                        });
                      },
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(
                            color: Color(0xff031481) ,
                            fontWeight: FontWeight.bold ,
                            fontSize: 16
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: (){},
                        child: Text(
                          "FORGET PASSWORD",
                          style: TextStyle(
                              color: Color(0xff031481) ,
                              fontWeight: FontWeight.bold ,
                              fontSize: 16
                          ),
                        ),
                    ),
                  ],
                ),

              ],
            ),
          )

        ),

      ),
      drawer: Drawer(

      ),
    );
  }

}
Widget iconChange() {
  if( b ) {
    return Icon ( Icons.visibility ) ;
  } else {
    return Icon ( Icons.visibility_off) ;
  }
}

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff031481),
        leading: IconButton(
            color: Colors.white,
            onPressed: () {
              setState(() {
                runApp(
                    MaterialApp(
                      debugShowCheckedModeBanner: false,
                      home: pMethod(),
                    )
                );
              });
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Text(
                    "CREATE ACCOUNT",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff031481),
                    ),
                  ),
                  SizedBox(height: 30,),
                  T_E(1, "FIRST NAME", "ENTER THE FIRST NAME",
                      Icons.person_add),
                  SizedBox(height: 30,),
                  T_E(2, "LAST NAME", "ENTER THE LAST NAME",
                      Icons.person_add_alt_1),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("DOB :", style: TextStyle(
                          color: Color(0xff031481), fontSize: 15),),
                      DropdownButton(
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xff031481),
                          ),
                          icon: Row(
                            children: [
                              Icon(Icons.arrow_drop_down),
                              IconButton(onPressed: () {
                                setState(() {
                                  yearV = null;
                                  dayV = null;
                                  day.clear();
                                });
                              }, icon: Icon(Icons.close, size: 13,)
                              ),
                            ],
                          ),
                          underline: Container(
                            height: 1,
                            color: Color(0xffff0000), // Underline color
                          ),
                          menuMaxHeight: 200,
                          menuWidth: 100,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          alignment: Alignment.center,
                          focusColor: Color(0xff031481),
                          hint: Text("YEAR"),
                          value: yearV,
                          items: year.map((String i) {
                            return DropdownMenuItem(
                                value: i, child: Center(child: Text(i))
                            );
                          }).toList(),
                          onChanged: (String ? i) {
                            setState(() {
                              if (monthV != null) dayV = null;
                              yearV = i;
                              if (monthV != null) datMethod(monthV, yearV);
                            });
                          }
                      ),
                      DropdownButton(
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff031481),
                        ),
                        icon: Row(
                          children: [
                            Icon(Icons.arrow_drop_down),
                            IconButton(onPressed: () {
                              setState(() {
                                monthV = null;
                                dayV = null;
                                day.clear();
                              });
                            }, icon: Icon(Icons.close, size: 13,)
                            ),
                          ],
                        ),
                        underline: Container(
                          height: 1,
                          color: Color(0xffff0000), // Underline color
                        ),
                        menuMaxHeight: 200,
                        menuWidth: 100,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        alignment: Alignment.center,
                        focusColor: Color(0xff031481),
                        items: month.map((String m) {
                          return DropdownMenuItem(
                              value: m, child: Center(child: Text(m)));
                        }).toList(),

                        hint: Text("MONTH"),
                        value: monthV,
                        onChanged: (String ? i) {
                          setState(() {
                            if (monthV != null) dayV = null;
                            monthV = i;

                            if (yearV != null) datMethod(monthV, yearV);
                          });
                        },
                      ),
                      DropdownButton(
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xff031481),
                          ),
                          icon: Row(
                            children: [
                              Icon(Icons.arrow_drop_down),
                              IconButton(onPressed: () {
                                setState(() {
                                  dayV = null;
                                });
                              }, icon: Icon(Icons.close, size: 13,)
                              ),
                            ],
                          ),
                          underline: Container(
                            height: 1,
                            color: Color(0xffff0000), // Underline color
                          ),
                          menuMaxHeight: 200,
                          menuWidth: 100,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          alignment: Alignment.center,
                          focusColor: Color(0xff031481),
                          value: dayV,
                          hint: Text("DAY",),
                          items: arrMethod(),
                          onChanged: (String? a) {
                            setState(() {
                              if (monthV == null || yearV == null)
                                dayV = null;
                              else
                                dayV = a;
                            });
                          }
                      ),
                    ],
                  ),

                  SizedBox(height: 30,),
                  GestureDetector(
                    child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(100)),
                            border: Border.all(
                              color: Color(0xff031481),
                            )
                        ),

                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(gender),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          gender = "GENDER";
                                        });
                                      },
                                      iconSize: 13,
                                      icon: Icon(Icons.close)
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          genderMethod(context);
                                        });
                                      },
                                      icon: Icon(Icons.arrow_drop_down)
                                  ),

                                ],
                              )
                            ],
                          ),
                        )
                    ),
                  ),

                  SizedBox(height: 30,),
                  T_E(3, "EMAIL ADDRESS", "ENTER THE EMAIL ADDRESS",
                      Icons.mail),
                  // pass( "ENTER PASSWORD" , "ENTER THE PASSWORD" , Icons.lock_outline_rounded  ) ,
                  SizedBox(height: 30,),
                  Pass(t1,
                      "ENTER PASSWORD",
                      "ENTER THE PASSWORD",
                      Icon(Icons.lock),
                      Icon(Icons.visibility),
                      true
                  ),
                  SizedBox(height: 30,),
                  Pass(t2,
                      "CONFIRM PASSWORD",
                      "ENTER PASSWORD AGAIN ",
                      Icon(Icons.lock),
                      Icon(Icons.visibility),
                      true
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "PASSWORD IS INCORRECT", style: TextStyle(color: colors),
                  ),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff031481),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(100),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(100),
                          splashColor: Colors.white70.withOpacity(0.8),
                          onTap: () {
                            setState(() {
                              if (t1.text.isEmpty || t2.text.isEmpty ||
                                  (t1.text != t2.text)) {
                                colors = Color(0xffff0000);
                              } else {

                                fn=select1.text;
                                ln=select2.text;
                                em=select3.text;
                                pass = t1.text ;
                                // server() ;
                                previous.clear();
                                loging.clear();
                                loging.add(MaterialApp(
                                  debugShowCheckedModeBanner: false,
                                  home: FurtherDetail(),
                                ));
                                colors = Colors.transparent;
                                runApp(
                                  MaterialApp(
                                    debugShowCheckedModeBanner: false,
                                    home: FurtherDetail(),
                                  ),
                                );
                              }
                            });
                          },
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 17),
                              child: Text(
                                "SIGN IN",
                                style: TextStyle(
                                  color: Colors.white,
                                  // Text color over gradient
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          )
      ),
    );
  }

  TextEditingController t1 = TextEditingController();

  TextEditingController t2 = TextEditingController();


  Color colors = Colors.transparent;


  final select1 = TextEditingController();

  final select2 = TextEditingController();

  final select3 = TextEditingController();



  Widget pMethod() {
    return previous.removeLast();
  }

  TextEditingController control(num) {
    if (num == 1)
      return select1;
    else if (num == 2)
      return select2;
    else
      return select3;
  }

  Widget T_E(num, l, h, i) {
    return TextField(
      controller: control(num),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffff0000)),
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff031481)),
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        prefixIcon: Icon(i),
        prefixIconColor: Color(0xff031481),
        labelText: l,
        hintText: h,
      ),
    );
  }

  void initState() {
    super.initState();
    Y();
    monthMethod();
  }

  List <DropdownMenuItem<String>> arrMethod() {
    List <DropdownMenuItem<String>> l = [];
    for (String d in day) {
      l.add(DropdownMenuItem(value: d, child: Center(child: Text(d)),));
    }
    return l;
  }

  List <String> year = [];


  Y() {
    for (int i = 2030; i >= 1990; i--) {
      year.add(i.toString());
    }
  }

  List <String> month = [];


  monthMethod() {
    for (int i = 1; i < 13; i++) {
      month.add(i.toString());
    }
  }

  List <String> day = [];


  datMethod(String? monthV, String? year) {
    if (monthV == null || yearV == null) return;
    day.clear();
    var t1 = [ 1, 3, 5, 7, 8, 10, 12];
    int ? d;
    int m = int.parse(monthV.toString());
    int y = int.parse(year.toString());
    if (t1.contains(m))
      d = 31;
    else if (((y % 4 == 0 && y % 100 != 0) || (y % 400 == 0)) && (m == 2)) {
      d = 29;
    }
    else if (m == 2)
      d = 28;
    else
      d = 30;
    for (int i = 1; i <= d; i++) {
      day.add(i.toString());
    }
  }

  void genderMethod(BuildContext c) {
    showModalBottomSheet(
        context: c,
        builder: (BuildContext c) {
          return Padding(
            padding: EdgeInsets.all(12),
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(

              ),
              child: Column(
                children: [
                  Text(
                    "CLICK YOUR GENDER",
                    style: TextStyle(
                        color: Color(0xff031481),
                        fontSize: 15
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: a.map((String v) {
                      return Row(
                        children: [
                          Radio(value: v,
                              groupValue: gender,
                              onChanged: (String ? vi) {
                                setState(() {
                                  gender = vi ?? "GENDER";
                                });
                                Navigator.pop(context);
                              }),
                          Text(v, style: TextStyle(color: Color(0xff031481)),)
                        ],
                      );
                    }
                    ).toList(),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}

String ? fn;
String ? ln;
String ? em;
String ? pass;
String ? yearV;
String ? dayV;
String ? monthV;

//login
String ? loginEmail ;
String ? loginPass ;
