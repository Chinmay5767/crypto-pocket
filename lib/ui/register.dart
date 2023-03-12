// ignore_for_file: non_constant_identifier_names
import 'dart:async';
//import 'dart:html';
import 'dart:ui';
import 'package:crypto_pocket/ui/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../net/flutterfire_function.dart';
import 'package:crypto_pocket/ui/homeView.dart';
import '../global.dart' as global;


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // ignore: non_constant_identifier_names
  final TextEditingController _EmailFeild = TextEditingController();
  final TextEditingController _PasswordFeild = TextEditingController();
   final TextEditingController _UserNameFeild = TextEditingController();
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
          "Register",
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
          image: DecorationImage(
            image: AssetImage("asset/back_auth.jpeg"),
            fit: BoxFit.cover,
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
                      controller: _UserNameFeild,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        hintText: "username",
                        // ignore: prefer_const_constructors
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        labelText: "username",
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
                          bool shouldNavigate = await register(
                              _EmailFeild.text, _PasswordFeild.text, _UserNameFeild.text);
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
                           
                              _showMessage = true;
                              Timer(Duration(seconds: 3), (() {
                                setState(() {
                                  _showMessage = false;
                                });
                              }));
                            });
                          }
                          if (isLoading2) return;
                          setState(
                            () {
                              isLoading2 = true;
                            },
                          );
                          await Future.delayed(Duration(seconds: 3));
                          setState(
                            () {
                              isLoading2 = false;
                            },
                          );
                        },
                        child: isLoading2
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
                                "Register",
                                style: TextStyle(color: Colors.yellow),
                              )),
                  ),
                  const SizedBox(height: 15.0),
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

