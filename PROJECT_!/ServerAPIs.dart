import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Methods__.dart';
import 'Pro1.dart';


var loginData ;
Future<void> server() async {
  final Map<String, dynamic> requestBody = {
    "gmail": em,
    "password": pass,
    "firstName": fn,
    "lastName": ln,
    "date": '$yearV-$monthV-$dayV',
    "gender": gender,
  };

  try {
    print ( "namamama ") ;
    final result = await http.post(
      Uri.parse('http://192.168.232.144:8082/FlutterBackEndProject/AddData'), // Replace with your local IP
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(requestBody),
    );

    if (result.statusCode == 200) {
      loginData = json.decode(result.body) ;
      print('Request succeeded: ${result.body}');
    } else {
      print('Request failed with status: ${result.statusCode}');
    }
  } catch (e) {
    print('Error occurred: $e');
  }
}
Future< void > login() async {

  print( 123 ) ;
  print ( loginEmail ) ;
  try{
    final login = await http.get(Uri.parse("http://192.168.232.144:8082/FlutterBackEndProject/GetDataByGmail?gmail=$loginEmail")) ;

    print ( loginEmail ) ;

    print(login.statusCode);

    if( login.statusCode == 200) {
      print( login.body );
      loginData = json.decode(login.body);
      checkPassWord( loginData ) ;
    }
    else {
      email_check = true ;
      password_check = true ;
    }
  }
  on TimeoutException {
    print("Request timed out.");
  }
  catch( e ) {
    print ( "dsvfbdgnfhmg" ) ;
  }

}

// Future<void> addImage(File imageFile, String email) async {
//   try {
//     // Create a multipart request
//     var request = http.MultipartRequest(
//       'POST',
//       Uri.parse("http://192.168.232.144:8082/FlutterBackEndProject/Photo/AddImageInDataBase?gmail=$email"),
//     );
//
//     // Add the file to the request
//     request.files.add(await http.MultipartFile.fromPath(
//       'mf', // Matches the backend parameter name
//       imageFile.path,
//     ));
//
//     var response = await request.send();
//
//     if (response.statusCode == 200) {
//       print("Image uploaded successfully!");
//     } else {
//       print("Failed to upload image. Status Code: ${response.statusCode}");
//     }
//   } catch (e) {
//     print("Error in addImage: $e");
//   }
// }
//



bool email_check = false ;
bool password_check = false ;

void checkPassWord( loginData ) {
  print (loginData[ 'gmail']);
  print (loginData[ 'password']);
  print (loginPass);
  print (loginEmail);


  if( loginData[ 'gmail'] != loginEmail ) {
    email_check = true ;
    password_check = true ;
  }
  else if( loginData['password'] != loginPass ) password_check = true ;


  print(password_check) ;
  print(email_check) ;
}
