import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> getImageLinkForName(String name) async {
  try {
    // Query the Firestore collection
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('userProfile')
        .where('name', isEqualTo: name)
        .get();

    // Extract the image link
    String imageLink = '';
    snapshot.docs.forEach((doc) {
      final data = doc.data() as dynamic;
      imageLink = data['imageLink'];
    });

    // Return the image link
    return imageLink;
  } catch (error) {
    print('Error fetching image link: $error');
    return "https://p.kindpng.com/picc/s/146-1468338_icon-profile-blue-transparent-hd-png-download.png";
  }
}
