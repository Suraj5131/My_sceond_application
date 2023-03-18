import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'driver.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? grNum;
  String? pwd;
  TextEditingController enroolNo = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  void initState(){
    load_data();
    super.initState();



  }
  void load_data() async{DocumentSnapshot _firestore = await FirebaseFirestore.instance
      .collection("driver_data")
      .doc("DRIVER")
      .get();
  Map a = _firestore.data() as Map;
  print("kfbsjkeukv : ${a.toString()}");
  grNum = a['driver_id'];
  pwd= a['pass_word'];

  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 180.0,
              height: 180.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Container(
              width: 350.0,
              child: TextFormField(
                controller: enroolNo,
                decoration: InputDecoration(
                  labelText: 'Enter User Id',
                  border: OutlineInputBorder(),

                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              width: 350.0,
              child: TextFormField(
                controller:password ,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Enter Password",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility_off_rounded)
                  ),
                ),
              ),
            SizedBox(height: 30.0),
            Container(
              width: 350.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                if(enroolNo.text.isEmpty ||enroolNo.text == null||
                    password.text.isEmpty ||password.text == null){
                  Fluttertoast.showToast(
                    msg: "Enter valid data",
                    toastLength: Toast.LENGTH_SHORT,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }else if(password.text == pwd && enroolNo.text == grNum){
                  Fluttertoast.showToast(
                    msg: "Login Succefully",
                    toastLength: Toast.LENGTH_SHORT,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Driver()));
                }else{
                  Fluttertoast.showToast(
                    msg: "Wrong Password or User Id",
                    toastLength: Toast.LENGTH_SHORT,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
                },
                child: Text('Log In'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
