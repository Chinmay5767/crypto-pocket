// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class Avatar extends StatelessWidget {
//   final String? avatarUrl;
//   final Function onTap;

//   const Avatar({ required this.avatarUrl,required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: GestureDetector(
//        onTap: onTap,
//        child: avatarUrl==null ? CircleAvatar(
//         radius: 50.0,
//         child: Icon(Icons.photo_camera),

//        ),
//        :
//        CircleAvatar(
//         radius: 50.0,
//         backgroundImage: NetworkImage(avatarUrl),
//        )
//       ),
//     );
//   }
// }


// gesture detector detect movement of user . on tap can be used because of gesture detector