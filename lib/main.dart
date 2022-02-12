import 'package:bgcolor_app/Home.dart';
import 'package:bgcolor_app/globals.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'settings.dart';



void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  preferences = await SharedPreferences.getInstance();
  var cl1=preferences.getString('color1');
  if(cl1==null){
     color1='0xFF6091FF';
     color2 ='0xFF69FEFF';
     color3 ='0xFF7FFF6F';
     color4 ='0xFFBF4B26';
     color5 ='0xFFF43135';
     color6 ='0xFFE96060';
     color7 ='0xFFFC8A8A';
     preferences.setString('color1', color1);
     preferences.setString('color2', color2);
     preferences.setString('color3', color3);
     preferences.setString('color4', color4);
     preferences.setString('color5', color5);
     preferences.setString('color6', color6);
     preferences.setString('color7', color7);
     BackgroundColor=color7;

  }else{
    color1=preferences.get('color1');
    color2=preferences.get('color2');
    color3=preferences.get('color3');
    color4=preferences.get('color4');
    color5=preferences.get('color5');
    color6=preferences.get('color6');
    color7=preferences.get('color7');
    BackgroundColor=color7;
  }
  runApp(
      MaterialApp(
    title: "bgcolor_app",
    home: Home(),
    routes: {
      'Settings': (context) => Settings(),
    },
  ));
}
