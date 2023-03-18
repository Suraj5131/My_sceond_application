import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Driver extends StatefulWidget {
  const Driver({super.key});

  @override
  State<Driver> createState() => _DriverState();
}
class _DriverState extends State<Driver> {
  var _fireStore;


  @override
  void initState() {
    _fireStore = FirebaseFirestore.instance
        .collection("driver_data")
        .doc("DRIVER")
        .snapshots();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _fireStore,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          var doc = snapshot.data as DocumentSnapshot;
          Map map = (doc.data() ?? {}) as Map;
          print(_fireStore.toString());
          if (map.isNotEmpty) {
            print(map.toString());
          } else {
            log('map is empty');
          }
          return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  IconButton(
                    icon: Icon(Icons.logout, color: Colors.black, size: 30),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Log out"),
                            content: Text('Are you sure you want to logout?'),
                            actions: [
                              TextButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('Logout'),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              body: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*.33,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 0)
                          ),
                          height: 300,
                          width: 300,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  radius: 80,
                                  backgroundColor: Colors.grey.shade100,
                                  backgroundImage:NetworkImage(map['img']),
                                ),
                                Column(
                                  children: [
                                    Text(map['uname'] ??"",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text(map['contact_no'] ??"",style: TextStyle(fontSize: 15),)
                                  ],
                                )
                              ]
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Text("Bus Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                    SizedBox(height: 5,),
                    Expanded(
                      child: ListView.builder(itemCount: map['bus_data'].length,
                          itemBuilder:(context, index){
                            Map a= map['bus_data'][index] as Map<String , dynamic>;
                            return Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(width: 80,child: Text("Bus No",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                                          Text(":",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                          Text(a['bus_no']??"",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(width: 80,child: Text("Time",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                                          Text(":",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                          Text(a['timing']??"",style: TextStyle(fontSize: 18),)
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(width: 80,child: Text("Shift",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                                          Text(":",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                          Text(a['shift']??"",style: TextStyle(fontSize: 18),)
                                        ],
                                      ),Row(
                                        children: [
                                          Container(width: 80,child: Text("Batch",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                                          Text(":",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                          Text(a['batch']??"",style: TextStyle(fontSize: 18),)
                                        ],
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(onPressed: (){
                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>Student_list()));
                                  },
                                    child: Text('Start'),style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                                  )
                                ],
                              ),
                            );
                          }),
                    )
                  ]
              ) );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

