import 'package:bus_services/models/dummydata.dart';
import 'package:bus_services/screens/homescreen.dart';
import 'package:bus_services/screens/journey.dart';
import 'package:bus_services/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:bus_services/globals.dart' as globals;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Services',
      theme: ThemeData(
        primarySwatch: globals.primary,
      ),
      home: const MyHomePage(title: 'Bus Services'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: isLoggedin(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return snapshot.data==0?const LoginPage():const HomePage();
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    );
  }
}
