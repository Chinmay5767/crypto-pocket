import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreData {
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName).child('id');
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot Snapshot = await uploadTask;
    String downloadUrl = await Snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveData({
    required Uint8List file,
    required String name,
  }) async {
    String resp = "some error ocurred";
    try {
      String imageUrl = await uploadImageToStorage('profileImage', file);
      await _firestore.collection('userProfile').add({'imageLink': imageUrl,
      'name': name});
      resp = "success";
     
      return resp;
    } catch (err) {
      resp = err.toString();
       print(resp + "----------------");
      return resp;
    }
  }
}
