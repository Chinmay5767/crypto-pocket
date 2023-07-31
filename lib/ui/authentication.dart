// ignore_for_file: non_constant_identifier_names
import 'dart:async';
//import 'dart:html';
import 'dart:ui';
import 'package:crypto_pocket/ui/profile_view.dart';
import 'package:crypto_pocket/ui/register.dart';
import 'package:flutter/material.dart';

import '../net/flutterfire_function.dart';
import 'package:crypto_pocket/ui/homeView.dart';
import '../global.dart' as global;


class Authentication extends StatefulWidget {


  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  // ignore: non_constant_identifier_names
  final TextEditingController _EmailFeild = TextEditingController();
  final TextEditingController _PasswordFeild = TextEditingController();
  bool isLoading = false;
  bool isLoading2 = false;
  bool _showMessage = false;
 

  void _onPressed_for_message() {
    setState(() {
      _showMessage = true;
      Timer(Duration(seconds: 3), () {
        setState(() {
          _showMessage = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Crypto Pocket",
          style: TextStyle(color: Colors.orange),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromARGB(0, 90, 87, 87),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // ignore: prefer_const_constructors
       decoration: BoxDecoration(
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Color.fromARGB(255, 40, 53, 147),
                Color.fromARGB(255, 48, 63, 159),
                Color.fromARGB(255, 57, 73, 171),
                Color.fromARGB(255, 92, 107, 192),
              ],
            ),
          ),

        child: BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
          child: Container(
            decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
            child: Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: _EmailFeild,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        hintText: "abc@email.com",
                        // ignore: prefer_const_constructors
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        labelText: "Email",
                        // ignore: prefer_const_constructors
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 35,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: _PasswordFeild,
                      obscureText: true,
                      //obscure text is used to hide what you put input as a password
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        hintText: "Password",
                        // ignore: prefer_const_constructors
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        labelText: "Password",
                        // ignore: prefer_const_constructors
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 35,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.3),
                      color: Colors.redAccent,
                    ),
                    child: MaterialButton(
                        highlightColor: Colors.red[900],
                        onPressed: () async {
                          bool shouldNavigate = await signIn(
                              _EmailFeild.text, _PasswordFeild.text);
                          if (shouldNavigate) {
                            //navigate
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeView(),
                              ),
                            );
                          } else {
                            setState(() {
                              global.error = "Incorrect password";
                              _showMessage = true;
                              Timer(Duration(seconds: 3), (() {
                                setState(() {
                                  _showMessage = false;
                                });
                              }));
                            });
                          }
                          if (isLoading) return;
                          setState(
                            () {
                              isLoading = true;
                            },
                          );
                          await Future.delayed(Duration(seconds: 3));
                          setState(
                            () {
                              isLoading = false;
                            },
                          );
                        },
                        child: isLoading
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    CircularProgressIndicator(
                                      color: Colors.yellow,
                                    ),
                                    SizedBox(
                                      width: 24.0,
                                    ),
                                    Text(
                                      "Please wait...",
                                      style: TextStyle(color: Colors.orange),
                                    )
                                  ])
                            : Text(
                                "Log in",
                                style: TextStyle(color: Colors.yellow),
                              )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 35,
                  ),
                 Container(
                  child: GestureDetector(
                    onTap: () {
                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Register(),
                              ),
                            );
                    },
                    child: Text(
                      "not registered, then click here to register",
                     style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.orange
                     ),
                    ),
                  ),
                 ),
                 
                  if (_showMessage)
                    Text(global.error, style: TextStyle(fontSize: 18, color: Colors.orange), ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}





/* you can also store email in variablr using on changed function in text form feild*/