// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../net/flutterfire_function.dart';
import 'package:crypto_pocket/ui/homeView.dart';

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
      appBar: AppBar(
        title: Text("Crypto Pocket"),
        centerTitle: true,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            color: Colors.tealAccent,
          ),
          child: Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/1.3,
                  child: TextFormField(
                    style: TextStyle(color: Color.fromARGB(246, 0, 0, 0)),
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
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/35,
                ),
                Container(
                  width: MediaQuery.of(context).size.width/1.3,
                  child: TextFormField(
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    controller: _PasswordFeild,
                    obscureText: true,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      hintText: "Password",
                      // ignore: prefer_const_constructors
                      hintStyle: TextStyle(
                        color: Colors.black87,
                      ),
                      labelText: "Password",
                      // ignore: prefer_const_constructors
                      labelStyle: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                 SizedBox(
                  height: MediaQuery.of(context).size.height/35,
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
                        bool shouldNavigate =
                            await signIn(_EmailFeild.text, _PasswordFeild.text);
                        if (shouldNavigate) {
                          //navigate
                           Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeView(),
                                  ),
                                  );
                        }
                      },
                      child: Text("Log in")),
                ),
                 SizedBox(
                  height: MediaQuery.of(context).size.height/35,
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
                            _EmailFeild.text, _PasswordFeild.text);
                        if (shouldNavigate) {
                          //navigate
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeView(),
                                  ),
                                  );
                        }
                      },
                      child: Text("Register")),
                ),
              ],
            ),
          )),
    );
  }
}
