import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../global.dart' as global;

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> register(String email, String password, String username) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    User? user = userCredential.user;

    if (user != null) {
      await user.updateDisplayName(username);
      return true;
    } else {
      return false;
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
      global.error = "The password provided is too weak";
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
      global.error = "The account already exists for that email.";
    }
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

// function to add coin v.i.a transaction method
Future<bool> addCoin(String? id, String amount) async {
  try {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    var value = double.parse(amount);
    // these documents are downloaded when you create a stream
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .collection("Coins")
        .doc(id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({'Amount': value});
        return true;
      }
      double newAmount = (snapshot.data() as Map?)?['Amount'] + value;
      transaction.update(documentReference, {'Amount': newAmount});
      return true;
    });

    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> subtractCoin(String? id, String amount) async {
  try {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    var value = double.parse(amount);
    // these documents are downloaded when you create a stream
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .collection("Coins")
        .doc(id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({'Amount': value});
        return true;
      }
      double newAmount = (snapshot.data() as Map?)?['Amount'] - value;
      if (newAmount < 0) newAmount = 0;
      transaction.update(documentReference, {'Amount': newAmount});
      return true;
    });

    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> removeCoin(String id) async {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore.instance
      .collection("Users")
      .doc(uid)
      .collection("Coins")
      .doc(id)
      .delete();

  return true;
}
