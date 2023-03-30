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

class HomeView extends StatefulWidget {
  const HomeView({super.key});

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
  
  @override
  @override
  void initState() {
    getValue();
  }

  getValue() async {
    bitcoin = await getPrice('bitcoin');

    ethereum = await getPrice('ethereum');
    tether = await getPrice('tether');
    dogecoin = await getPrice('dogecoin');
    binancecoin = await getPrice('binancecoin');
    ripple = await getPrice('ripple');
  
    setState(() {});
  }

  Widget build(BuildContext context) {
    getValues(String id, double amount) {
      if (id == "bitcoin") {
        globals.total+=bitcoin * amount;
        return bitcoin * amount;
      } else if (id == "ethereum") {
         globals.total+=ethereum * amount;
        return ethereum * amount;
      } else if (id == "tether") {
          globals.total+=tether * amount;
        return tether * amount;
      } else if (id == "dogecoin") {
          globals.total+=dogecoin * amount;
        return dogecoin * amount;
      } else if (id == "binancecoin") {
          globals.total+=binancecoin * amount;
        return binancecoin * amount;
      } else if (id == "ripple") {
          globals.total+=ripple * amount;
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
            padding: const EdgeInsets.only(right:23.0),
            child: IconButton( icon: Icon(
              Icons.account_box_rounded,
             size: 50,
             color: Colors.white,
            ),
            onPressed: () {
                Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => ProfileView()),
              ),
            );
            },),
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
