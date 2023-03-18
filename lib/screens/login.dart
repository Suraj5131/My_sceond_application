import 'package:bus_services/models/driver.dart';
import 'package:bus_services/models/dummydata.dart';
import 'package:flutter/material.dart';
import 'package:bus_services/globals.dart' as globals;
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  double screenWidth=100, screenHeight=100;
  TextEditingController username = TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: "");
  bool isload = false;


  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(globals.loginBg),
            fit: BoxFit.cover
          )
        ),
        child: Scaffold(
          backgroundColor: globals.primary.withOpacity(0.7),
          body: Column(
            children: [
              Expanded(
                child: screenWidth<640
                    //mobile or small screen view
                    ?ListView(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    //the application logo
                    SizedBox(
                      height: screenHeight*0.3,
                        child: Image.asset("assets/appLogo.png",),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    //login data
                    Column(

                      children:  [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Neumorphic(
                            style: NeumorphicStyle(
                                shape: NeumorphicShape.flat,
                                shadowLightColor: globals.secondary,
                                color: Colors.white.withOpacity(0.8)
                            ),
                            child: TextField(
                              controller: username,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Enter username"
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Neumorphic(
                            style: NeumorphicStyle(
                                shape: NeumorphicShape.flat,
                                shadowLightColor: globals.secondary,
                                color: Colors.white.withOpacity(0.8)
                            ),
                            child: TextField(
                              controller: password,
                              obscureText: true,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                border: InputBorder.none,
                                hintText: "Enter Password",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Neumorphic(
                          style:  NeumorphicStyle(
                            lightSource: LightSource.top,
                            depth: 0,
                            intensity: 0,
                            color: globals.compliment,
                            shape: NeumorphicShape.concave,
                            shadowLightColor:globals.compsecondary,
                          ),
                          child: RawMaterialButton(
                            onPressed: (){
                              setState(() {
                                isload = true;
                              });
                              if(username.text=="driver" && password.text=="123"){
                                globals.userGlob = Driver.fromMap(users[0]);

                              }
                              setState(() {
                                if(globals.userGlob!=null)
                                  controller.sink.add(1);
                                isload = false;
                              });
                            },
                            child: Container(
                              height: screenHeight*0.1,
                              width: screenWidth>1000?screenWidth*0.27:270,
                              child: const Center(
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                    letterSpacing: 3,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
                    //web or large screen view
                    :Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Spacer(),
                    //the application logo
                    SizedBox(
                        width: screenWidth*0.2,
                        child: Image.asset("assets/appLogo.png",),
                    ),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    //login data
                    Stack(
                      children: [
                        Container(
                          height: screenHeight,
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(50.0),
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                shape: NeumorphicShape.convex,
                                shadowLightColor: globals.primShade2,
                                shadowDarkColor: globals.primShade2,
                                color: globals.primary.withOpacity(0.9)
                              ),
                              child: Container(
                                height: screenHeight*0.35,
                                width: screenWidth>1000?screenWidth*0.3:300,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Spacer(),
                                      Neumorphic(
                                        style: NeumorphicStyle(
                                          shape: NeumorphicShape.flat,
                                          shadowLightColor: globals.secondary,
                                          color: Colors.white.withOpacity(0.8)
                                        ),
                                        child: TextField(
                                          controller: username,
                                          decoration: const InputDecoration(
                                              contentPadding: EdgeInsets.symmetric(
                                                horizontal: 16,
                                              ),
                                            border: InputBorder.none,
                                            hintText: "Enter username"
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Neumorphic(
                                        style: NeumorphicStyle(
                                            shape: NeumorphicShape.flat,
                                            shadowLightColor: globals.secondary,
                                            color: Colors.white.withOpacity(0.8)
                                        ),
                                        child: TextField(
                                          controller: password,
                                          obscureText: true,
                                          decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.symmetric(
                                              horizontal: 16,
                                            ),
                                              border: InputBorder.none,
                                            hintText: "Enter Password",
                                          ),
                                        ),
                                      ),
                                     Spacer(),
                                      Neumorphic(
                                        style:  NeumorphicStyle(
                                          lightSource: LightSource.top,
                                          depth: 0,
                                          intensity: 0,
                                          color: globals.compliment,
                                          shape: NeumorphicShape.convex,
                                          shadowLightColor:globals.compsecondary,
                                        ),
                                        child: RawMaterialButton(
                                          onPressed: (){
                                            setState(() {
                                              isload = true;
                                            });
                                            if(username.text=="driver" && password.text=="123"){
                                              globals.userGlob = Driver.fromMap(users[0]);

                                            }
                                            setState(() {
                                              if(globals.userGlob!=null)
                                                controller.sink.add(1);
                                              isload = false;
                                            });
                                          },
                                          child: Container(
                                            height: screenHeight*0.1,
                                            width: screenWidth>1000?screenWidth*0.27:270,
                                            child:  Center(
                                              child: isload?const CircularProgressIndicator():const Text(
                                                "LOGIN",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 20,
                                                  letterSpacing: 3,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Center(
                  child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: const[
                    Text("Powered by", style: TextStyle(color: Colors.white),),
                    Text(
                      " Bitblue",
                      style: TextStyle(color: Colors.blue),
                    ),
                    Text(
                      "Technology",
                      style: TextStyle(color: Colors.red),
                    )
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
