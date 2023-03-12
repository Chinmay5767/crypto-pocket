import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_pocket/ui/profile/avatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';

// class ProfileView extends StatefulWidget {
//   static String route = "profile-view";

//   @override
//   _ProfileViewState createState() => _ProfileViewState();
// }

// class _ProfileViewState extends State<ProfileView> {
//  // late UserModel _currentUser;
//   // late keyword shows that it  will be initialized later

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
//                   //   avatarUrl: _currentUser.avatarUrl,
//                   //   onTap: () {
//                   //     // TODO:  upload the image to firestore
//                   //   },
//                   // ),
//                   Text("hi, "),
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
class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return Scaffold(
        body: Center(
          child: Text("welcome, ${user.displayName ?? user.email}"),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: Text("please login to continue"),
        ),
      );
    }
  }
}
