import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_pocket/net/api_method.dart';
import 'package:crypto_pocket/net/flutterfire_function.dart';
import 'package:crypto_pocket/ui/add_view.dart';
import 'package:crypto_pocket/ui/profile_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../global.dart' as global;
import '../global.dart' as globals;
import '../model/firestoreImage.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double bitcoin = 0.0;
  double ethereum = 0.0;
  double tether = 0.0;
  double dogecoin = 0.0;
  double binancecoin = 0.0;
  double ripple = 0.0;
  User? user = FirebaseAuth.instance.currentUser;
  @override
  @override
  void initState() {
    getValue();
    String? name = user?.displayName ?? user?.email;
    getImageLinkForName(name!);
    
  }

  getValue() async {
    bitcoin = await getPrice('bitcoin');
    if (bitcoin == 0) bitcoin = 2541727.0;
    ethereum = await getPrice('ethereum');
    if (ethereum == 0) ethereum = 160391.00;
    tether = await getPrice('tether');
    if (tether == 0) tether = 82.04;
    dogecoin = await getPrice('dogecoin');
    if (dogecoin == 0) dogecoin = 5.60;
    binancecoin = await getPrice('binancecoin');
    if (binancecoin == 0) binancecoin = 20102.00;
    ripple = await getPrice('ripple');
    if (ripple == 0) ripple = 39.92;
    setState(() {});
  }

  // image url fetching
  String GlobalImageLink =
      "https://p.kindpng.com/picc/s/146-1468338_icon-profile-blue-transparent-hd-png-download.png";
  Future<void> getImageLinkForName(String name) async {
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

      GlobalImageLink = imageLink;
    } catch (error) {
     
    }
  }

  Widget build(BuildContext context) {
    getValues(String id, double amount) {
      //  getValue();
      if (id == "bitcoin") {
        globals.total += bitcoin * amount;
        return bitcoin * amount;
      } else if (id == "ethereum") {
        globals.total += ethereum * amount;
        return ethereum * amount;
      } else if (id == "tether") {
        globals.total += tether * amount;
        return tether * amount;
      } else if (id == "dogecoin") {
        globals.total += dogecoin * amount;
        return dogecoin * amount;
      } else if (id == "binancecoin") {
        globals.total += binancecoin * amount;
        return binancecoin * amount;
      } else if (id == "ripple") {
        globals.total += ripple * amount;
        return ripple * amount;
      }
    }

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("home view"),
        backgroundColor: Colors.lightGreen,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 23.0),
            child: IconButton(
              icon: Icon(
                Icons.account_box_rounded,
                size: 50,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => ProfileView(GlobalImageLink)),
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.lightGreen,
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Container(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Users')
                      .doc(FirebaseAuth.instance.currentUser?.uid)
                      .collection('Coins')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView(
                      children: snapshot.data!.docs.map((document) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4.0, horizontal: 4.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.3,
                            height: MediaQuery.of(context).size.height / 12,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: Color.fromARGB(255, 0, 91, 3)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 3.0,
                                ),
                                Text(
                                  "Coin: ${document.id}",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "\₹${getValues(document.id, (document.data() as Map?)?['Amount'])?.toStringAsFixed(2)}",
                                  style: TextStyle(color: Colors.white),
                                ),
                                IconButton(
                                    onPressed: () async {
                                      await removeCoin(document.id);
                                    },
                                    icon: Icon(
                                      Icons.close_sharp,
                                      color: Color.fromARGB(246, 0, 0, 0),
                                    ))
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => AddView()),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
