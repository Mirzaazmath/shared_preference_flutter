import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomePage/HomePage.dart';
import 'LOGIN/Login.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),

    );
  }
}
class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  SharedPreferences? userdata;
  bool? newuser;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),(){
      Check_user();

    });

    }
  void Check_user() async {
   userdata = await SharedPreferences.getInstance();
   newuser=(userdata?.getBool('login'));
   if(newuser==false){
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));

   }else{

     Navigator.pushReplacement(
         context, MaterialPageRoute(builder: (context) => LoginPage()));


   }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       decoration: BoxDecoration(
           gradient: LinearGradient(
             begin: Alignment.topRight,
             end: Alignment.bottomLeft,
             colors: [
               Colors.blue,
               Colors.red,
             ],
           )
       ),
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Image.asset("assets/one.png"),
      ),
    );
  }
}

