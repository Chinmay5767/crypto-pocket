import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_pocket/ui/authentication.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../global.dart' as globals;

import '../model/firestoreImage.dart';
import '../resources/add_data.dart';

class ProfileView extends StatefulWidget {
  static String route = "profile-view";
  String imageLink;
  ProfileView(this.imageLink);
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
  String? name = "";
  String? email = "k";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    name = user?.displayName ?? user?.email;
    email=user?.email;
  }

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
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 66,
                        backgroundImage: NetworkImage(widget.imageLink),
                      ),
                    ],
                  )
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
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 15,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                                color: Colors.white),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  "User Name: ${name!}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 15,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                                color: Colors.white),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  "email address: ${email!}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                         
                          SizedBox(height: 35,),
                          Container(
                            width: 240,
                            height: 50,
                            child: MaterialButton(
                                                  
                            onPressed: () {
                                                Navigator.push(
                             context,
                            MaterialPageRoute(
                                       builder: ((context) => Authentication()),
                                          ),
                                           );
                               },
                                               color: Colors.blue, // Set the button color to blue
                                                  child: Text(
                                             'Sign Out',
                                                style: TextStyle(
                                                   color: Colors.white, // Set the text color to white
                                               ),
                                          ),
                                             ),
                          ),
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
