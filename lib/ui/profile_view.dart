// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// class UserModel {
//   final String uid;
//   final String email;
//   final String name;
//   final String profileImageUrl;

//   UserModel({
//     required this.uid,
//     // required keyword is used to mark a parameter as mandatory when 
//     //an object of the class is created, and a compile-time error will be thrown if it is omitted.
//     required this.email,
//     required this.name,
//     required this.profileImageUrl,
//   });
// }


// class ProfileView extends StatefulWidget {
//   static String route = "profile-view";

//   @override
//   _ProfileViewState createState() => _ProfileViewState();
// }

// class _ProfileViewState extends State<ProfileView> {
  
//   //UserModel _currentUser = locator.get<UserController>().currentUser;
//   final User? user = FirebaseAuth.instance.currentUser;
//     final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
//  final DocumentReference userDoc = userCollection.doc(user!.uid);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Theme.of(context).primaryColor,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(20.0),
//                   bottomRight: Radius.circular(20.0),
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   // Avatar(
//                   //   avatarUrl: _currentUser?.avatarUrl,
//                   //   onTap: () {},
//                   // ),
//                   Text(
//                       "Hi ${ 'nice to see you here.'}"),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//               flex: 2,
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children: <Widget>[
//                     TextFormField(
//                       decoration: InputDecoration(hintText: "Username"),
//                     ),
//                     SizedBox(height: 20.0),
//                     Expanded(
//                       child: Column(
//                         children: <Widget>[
//                           Text(
//                             "Manage Password",
//                             style: Theme.of(context).textTheme.bodyMedium,
//                           ),
//                           TextFormField(
//                             decoration: InputDecoration(hintText: "Password"),
//                           ),
//                           TextFormField(
//                             decoration:
//                                 InputDecoration(hintText: "New Password"),
//                           ),
//                           TextFormField(
//                             decoration:
//                                 InputDecoration(hintText: "Repeat Password"),
//                           )
//                         ],
//                       ),
//                     ),
//                     MaterialButton(
//                       onPressed: () {
//                         // TODO: Save somehow
//                         Navigator.pop(context);
//                       },
//                       child: Text("Save Profile"),
//                     )
//                   ],
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
 
String userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          
          children: [
            StreamBuilder<DocumentSnapshot>(
  stream: FirebaseFirestore.instance.collection('users').doc(userId).snapshots(),
  builder: (context, snapshot) {
    if (!snapshot.hasData) {
        return CircularProgressIndicator();
    }
    var userData = snapshot.data!;
    return Column(
        children: [
          
          Text(userData['name']),
          Text(userData['email']),
        ],
    );
  },
)

          ]),
      ),
    );
  }
}