import 'package:crypto_pocket/ui/add_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:crypto_pocket/ui/homeView.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';
import 'package:crypto_pocket/net/api_method.dart';
import 'package:crypto_pocket/net/flutterfire_function.dart';

class Prices extends StatefulWidget {


  @override
  State<Prices> createState() => _PricesState();
}

class _PricesState extends State<Prices> {
  double bitcoin = 0.0;

  double ethereum = 0.0;

  double tether = 0.0;

  double dogecoin = 0.0;

  double binancecoin = 0.0;

  double ripple = 0.0;
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

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
         decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Color.fromARGB(255, 48, 171, 175),
              Color.fromARGB(255, 48, 126, 159),
              Color.fromARGB(255, 57, 103, 171),
              Color.fromARGB(255, 100, 92, 192),
            ],
          ),
        ),
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
            
              padding: EdgeInsets.only(left: 17.0,right: 17.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("bitcoin :",
                  textAlign: TextAlign.justify,),
              //    SizedBox(width:58.0),
                  Text("₹$bitcoin",
                  textAlign: TextAlign.center,),
                

                ],
              ),
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                
                 border: Border.all(
                      color: Colors.green,
                      width: 8,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ), //Offset
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), 
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
              ),
              
            ),
            SizedBox(
              height:10,
            ),
             Container(
                 padding: EdgeInsets.only(left: 17.0,right: 17.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("ethereum :",
                  textAlign: TextAlign.justify,),
               //   SizedBox(width:45.0),
                  Text("₹$ethereum",
                  textAlign: TextAlign.right,),

                ],
              ),
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                
                 border: Border.all(
                      color: Colors.green,
                      width: 8,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ), //Offset
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), 
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
              ),
              
            ),
             SizedBox(
              height:10,
            ),
             Container(
                padding: EdgeInsets.only(left: 17.0,right: 17.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("tether :",
                  textAlign: TextAlign.justify,),
               //   SizedBox(width:45.0),
                  Text("₹$tether",
                  textAlign: TextAlign.right,),

                ],
              ),
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                
                 border: Border.all(
                      color: Colors.green,
                      width: 8,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ), //Offset
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), 
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
              ),
              
            ),
             SizedBox(
              height:10,
            ),
             Container(
               padding: EdgeInsets.only(left: 17.0,right: 17.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("dogecoin :",
                  textAlign: TextAlign.justify,),
               //   SizedBox(width:45.0),
                  Text("₹$dogecoin",
                  textAlign: TextAlign.right,),

                ],
              ),
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                
                 border: Border.all(
                      color: Colors.green,
                      width: 8,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ), //Offset
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), 
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
              ),
              
            ),
             SizedBox(
              height:10,
            ),
             Container(
               padding: EdgeInsets.only(left: 17.0,right: 17.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("binancecoin :",
                  textAlign: TextAlign.justify,),
               //   SizedBox(width:45.0),
                  Text("₹$binancecoin",
                  textAlign: TextAlign.right,),

                ],
              ),
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                
                 border: Border.all(
                      color: Colors.green,
                      width: 8,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ), //Offset
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), 
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
              ),
              
            ),
             SizedBox(
              height:10,
            ),
             Container(
                padding: EdgeInsets.only(left: 17.0,right: 17.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("ripple :",
                  textAlign: TextAlign.justify,),
               //   SizedBox(width:45.0),
                  Text("₹$ripple",
                  textAlign: TextAlign.right,),

                ],
              ),
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                
                 border: Border.all(
                      color: Colors.green,
                      width: 8,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ), //Offset
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), 
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
              ),
              
            ),

            
          ],
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
