

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../HomePage/HomePage.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
          backgroundColor: Colors.grey[300],
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.blue,
                            Colors.red,
                          ]

                      ),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(150))

                  ),
                  alignment: Alignment.center,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.4,
                  child: Image.asset("assets/one.png"),
                ),
                SizedBox(height: 50,),
                Text("LOGIN", style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 50),),


                Padding(padding: EdgeInsets.all(20),
                    child: TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: "EMAIL ID",
                        label: Text("EMAIL ID:"),
                        prefixIcon: Icon(Icons.mail),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      validator: (value) {
                        // Check if this field is empty
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }

                        // using regular expression
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return "Please enter a valid email address";
                        }

                        // the email is valid
                        return null;
                      },
                    )),
                Padding(padding: EdgeInsets.all(20),
                    child: TextFormField(
                      controller: password,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        hintText: "PASSWORD",
                        label: Text("PASSWORD:"),
                        prefixIcon: Icon(Icons.key),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure ? Icons.visibility : Icons
                              .visibility_off,),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),


                      ),
                      validator: (value) {
                        // Check if this field is empty
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }

                        // using regular expression
                        if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                            .hasMatch(value)) {
                          return "Please enter a valid password";
                        }

                        // the email is valid
                        return null;
                      },
                    )),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: RaisedButton(

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),),

                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        String emailAdd = email.text;
                        String safePass = password.text;
                        print(emailAdd);
                        print(safePass);

                        if (emailAdd != '' && safePass != '') {
                          SharedPreferences userdata = await SharedPreferences
                              .getInstance();
                          userdata.setBool('login', false);
                          userdata.setString('email', emailAdd);
                          userdata.setString('password', safePass);

                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) =>
                              HomePage()));
                        }
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.blue,
                            Colors.red,
                          ],

                        ),
                        borderRadius: BorderRadius.circular(50),


                      ),
                      alignment: Alignment.center,
                      child: Text("LOGIN",
                        style: TextStyle(color: Colors.white, fontSize: 20),),


                    ),
                  ),

                )


              ],
            ),
          )
      ),
    );
  }

}