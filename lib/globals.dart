//primary color
import 'package:bus_services/models/driver.dart';
import 'package:flutter/material.dart';

int r = 90;
int g = 82;
int b = 200;

Driver? userGlob;

Map<int, Color> color = {
  50: Color.fromRGBO(r, g, b, .1),
  100: Color.fromRGBO(r, g, b, .2),
  200: Color.fromRGBO(r, g, b, .3),
  300: Color.fromRGBO(r, g, b, .4),
  400: Color.fromRGBO(r, g, b, .5),
  500: Color.fromRGBO(r, g, b, .6),
  600: Color.fromRGBO(r, g, b, .7),
  700: Color.fromRGBO(r, g, b, .8),
  800: Color.fromRGBO(r, g, b, .9),
  900: Color.fromRGBO(r, g, b, 1),
};

//important colors
MaterialColor primary = MaterialColor(0xff5a52c8, color);
Color secondary = Color(0xffcbcce9);
Color compliment = Color(0xff4f86c6);
Color compsecondary =  Color(0xff4fb0c6);
Color primShade2 = Color(0xff8084cc);

//network images
String loginBg = "https://dxsa.dextro-exam.com/dextro_bus/assets/admin/images/bg-1.jpg";