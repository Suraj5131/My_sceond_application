import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Pages/driver.dart';
import 'Pages/login.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp();

  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future:_initialization ,builder: (context ,snapshot){

      if(snapshot.connectionState==ConnectionState.done){
        return MaterialApp(
          title: 'Flutter ',
          debugShowCheckedModeBanner: false,
          // home: HomePage(),
          home: HomePage(),
        );
      }if(snapshot.hasError){
        print("Something wents wrong");
      }
      return CircularProgressIndicator();
    });
  }
}
