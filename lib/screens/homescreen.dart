import 'package:bus_services/models/bus.dart';
import 'package:bus_services/models/dummydata.dart';
import 'package:bus_services/screens/journey.dart';
import 'package:bus_services/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:bus_services/globals.dart' as globals;
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double screenWidth = 100, screenHeight = 100;
  List<Bus>? busDetails;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      busDetails = (buses.map((e) => Bus.fromMap(e)).toList()) as List<Bus>?;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: Image.asset("assets/appLogo.png"),
            ),
            Expanded(child: Container()),
            IconButton(
              onPressed: (){
                globals.userGlob = null;
                controller.sink.add(0);
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: globals.primary,
            stretch: true,
            pinned: false,
            snap: true,
            floating: true,
            expandedHeight: screenWidth<640?screenHeight*0.2:screenHeight*0.25,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [StretchMode.zoomBackground],
              background: Row(
                children: [
                  SizedBox(
                    width: screenWidth*0.05,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.4),
                    radius: screenWidth<640?40:60,
                    foregroundImage: NetworkImage(globals.userGlob!.img),
                    child: CircularProgressIndicator(),
                  ),
                  SizedBox(
                    width: screenWidth<640?screenWidth*0.05:screenWidth*0.03,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(globals.userGlob!.name, style: TextStyle(
                        fontSize: screenWidth<640?20:25,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),),
                      SizedBox(height: screenWidth<640?5:15,),
                      Text(globals.userGlob!.phone, style: TextStyle(
                        fontSize: screenWidth<640?15:17.5,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),

          ),

          //Text
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Bus Details", style: TextStyle(
                fontSize: screenWidth<640?20:30,
                fontWeight: FontWeight.w700
              ),),
            ),
          ),


          busDetails==null
              ?
          SliverToBoxAdapter(
            child: CircularProgressIndicator(),
          ):

          busDetails!.isEmpty?SliverToBoxAdapter(
            child: Text("No buses assigned to you"),
          ):(
              //dummy
              screenWidth<640
                  ?
              SliverList(delegate: SliverChildBuilderDelegate(
                      (context, index) =>  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            globals.primary,
                            globals.compliment,
                            globals.compsecondary,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Bus No: ", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),),
                                      Expanded(
                                        child: Text(busDetails![index].bus_num, style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Batch: ", style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),),
                                      Expanded(
                                        child: Text(busDetails![index].batch,style: TextStyle(
                                          color: Colors.white.withOpacity(0.8),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Timing: ", style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),),
                                      Expanded(
                                        child: Text(busDetails![index].time, style: TextStyle(
                                          color: Colors.white.withOpacity(0.8),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Neumorphic(
                              style: NeumorphicStyle(
                                color: globals.primary.withOpacity(0.2),
                                shadowLightColor: globals.secondary,
                                shape: NeumorphicShape.concave,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: RawMaterialButton(
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context)=>JourneyDetailPage(bus: busDetails![index])
                                    ),
                                    );
                                  },
                                  child: Center(
                                    child: Text(
                                      "Start",
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  childCount: busDetails!.length
              ),

              ):

              SliverToBoxAdapter(
                child: Center(
                  child: Wrap(
                    children: List.generate(busDetails!.length, (index) => Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: screenWidth<840?screenWidth*0.23:screenWidth*0.18,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              globals.primary,
                              globals.compliment,
                              globals.compsecondary,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Bus No: ", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),),
                                      Expanded(
                                        child: Text(busDetails![index].bus_num, style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Batch: ", style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),),
                                      Expanded(
                                        child: Text(busDetails![index].batch,style: TextStyle(
                                          color: Colors.white.withOpacity(0.8),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Timing: ", style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),),
                                      Expanded(
                                        child: Text(busDetails![index].time, style: TextStyle(
                                          color: Colors.white.withOpacity(0.8),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Neumorphic(
                              style: NeumorphicStyle(
                                color: globals.primary.withOpacity(0.7),
                                shadowLightColor: globals.secondary,
                                shape: NeumorphicShape.concave,
                                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
                                intensity: 0,
                                depth: 0,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                                ),
                                child: RawMaterialButton(
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context)=>JourneyDetailPage(bus: busDetails![index])
                                    ),
                                    );
                                  },
                                  child: Center(
                                    child: Text(
                                      "Start",
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}
