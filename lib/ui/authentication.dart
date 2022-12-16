// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
   
   // ignore: non_constant_identifier_names
   final TextEditingController _EmailFeild = TextEditingController();
   final TextEditingController _PasswordFeild = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
          child: Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  controller: _EmailFeild,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    hintText: "abc@email.com",
                    // ignore: prefer_const_constructors
                    hintStyle: TextStyle(
                    color: Colors.black87,
          
                    ),
                    labelText: "Email",
                    // ignore: prefer_const_constructors
                    labelStyle: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ),
                TextFormField(
                   controller: _PasswordFeild,
                   obscureText: true,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    hintText: "Passw",
                    // ignore: prefer_const_constructors
                    hintStyle: TextStyle(
                    color: Colors.black87,
          
                    ),
                    labelText: "Pass",
                    // ignore: prefer_const_constructors
                    labelStyle: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.3),
                    color: Colors.redAccent,
          
                  ),
                  child: MaterialButton(onPressed:() {} , child: Text("Log in")),
                ),
                Container(
                   width: MediaQuery.of(context).size.width / 1.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.3),
                    color: Colors.redAccent,
          
                  ),
                  child: MaterialButton(onPressed:() {} , child: Text("password")),),
              ],
            ),
          )),
    );
  }
}
