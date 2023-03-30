import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../global.dart' as globals;

import '../model/user_model.dart';

class ProfileView extends StatefulWidget {
  static String route = "profile-view";

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  // late UserModel _currentUser;
  // late keyword shows that it  will be initialized later
  final TextEditingController _newPasswordField = TextEditingController();
  final TextEditingController _verifyPasswordField = TextEditingController();
 

  User? user = FirebaseAuth.instance.currentUser;
  String Message = "";
  bool _showMessage2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // Avatar(
                  //   avatarUrl: _currentUser.avatarUrl,
                  //   onTap: () {
                  //     // TODO:  upload the image to firestore
                  //   },
                  // ),
                  Text("hi, "),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                   
                    Text(
                      "welcome, ${user?.displayName ?? user?.email}",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 20.0),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Manage Password",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(hintText: "New Password"),
                            controller: _newPasswordField,
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(hintText: "Repeat Password"),
                            controller: _verifyPasswordField,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          MaterialButton(
                            onPressed: () {
                              if (_verifyPasswordField.text !=
                                  _newPasswordField.text) {
                                setState(() {
                                  Message = "Incorrect password";
                                  _showMessage2 = true;
                                  Timer(Duration(seconds: 3), (() {
                                    setState(() {
                                      _showMessage2 = false;
                                    });
                                  }));
                                });
                              } else if (_newPasswordField.text.length < 6) {
                                setState(() {
                                  Message = "Password is too weak";
                                  _showMessage2 = true;
                                  Timer(Duration(seconds: 3), (() {
                                    setState(() {
                                      _showMessage2 = false;
                                    });
                                  }));
                                });
                              } else {
                                user?.updatePassword(_newPasswordField.text);
                              }
                            },
                            child: Text("Save profile"),
                          ),
                          if (_showMessage2) Text(Message),
                          Text("Total Amount: ₹${globals.total}")
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
// class ProfileView extends StatefulWidget {
//   const ProfileView({super.key});

//   @override
//   State<ProfileView> createState() => _ProfileViewState();
// }

// class _ProfileViewState extends State<ProfileView> {
//   @override
//   Widget build(BuildContext context) {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       return Scaffold(
//         body: Center(
//           child: Text("welcome, ${user.displayName ?? user.email}"),
//         ),
//       );
//     } else {
//       return Scaffold(
//         body: Center(
//           child: Text("please login to continue"),
//         ),
//       );
//     }
//   }
// }
