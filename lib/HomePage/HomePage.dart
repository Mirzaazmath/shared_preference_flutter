import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../LOGIN/Login.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedPreferences? userdata;
  String? userName;
  String? userPass;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   paste();
  }
void paste()async{
    userdata = await SharedPreferences.getInstance();
  setState(() {
    userName = userdata?.getString('email')!;
    userPass = userdata?.getString('password')!;
    print(userName);
    print(userPass);
      if(userName == null||userPass == null) {
        Usernull_check();
      }
  });
}
void Usernull_check() async {
  userdata = await SharedPreferences.getInstance() as SharedPreferences?;
   await userdata?.clear();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => LoginPage(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Center(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Text("WELCOME"),
              SizedBox(height: 10,),
              Text("Your User Name : $userName"),
              SizedBox(height: 10,),
              Text("Your Password : $userPass"),



            ],


          ),
        )
      )
    );
  }
}
