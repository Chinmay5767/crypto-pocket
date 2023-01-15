import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:crypto_pocket/net/flutterfire_function.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddView extends StatefulWidget {
  const AddView({super.key});

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  List<String> coins = [
    "bitcoin",
   
    "tether",
    "ethereum",
  ];

  String? dropValue = "bitcoin";
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = new FocusNode();
    return Material(
            child: Container(
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
           Color.fromARGB(255, 40, 53, 147),
            Color.fromARGB(255, 48, 63, 159),
            Color.fromARGB(255, 57, 73, 171),
            Color.fromARGB(255, 92, 107, 192),
          ],
        ),
      ),
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              DropdownButton(
               dropdownColor: Colors.indigo,
                icon: Icon(
                  Icons.monetization_on,
                  color: Colors.lightGreen,
                ),
                value: dropValue,
              focusColor: Colors.lightGreen,
              
                 onChanged: (String? value) {
                  setState(() {
                    dropValue = value;
                  });
                 
                },
                items: coins.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(
                     child: Container(
                      
                      child: Text(value,
                      style: TextStyle(
                        color: Colors.amber
                      ),),
                      padding:EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.5) ,
                    
                      
                      ),
                    value: value,
                   
                    
                   
                  );
                }).toList(),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.amber,
                  ) ,
                  controller: _amountController,
                  decoration: InputDecoration(
                    
                    labelText: "coin amount 💸",
                    labelStyle: TextStyle(
        color: myFocusNode.hasFocus ? Colors.yellowAccent : Colors.amber
      )
                  
                   
                  ),
                  
                ),
              ),
               SizedBox(
                  height: 16.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                child: MaterialButton(
                  onPressed: () async {
                    await addCoin(dropValue, _amountController.text);
                    Navigator.of(context).pop();
                  },
                  child: Text("Add 🤑"),
                  color: Colors.lightGreen,
                ),
                
              ),
              SizedBox(
                  height: 16.0,
              ),
                Container(
                width: MediaQuery.of(context).size.width / 1.4,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                child: MaterialButton(
                  onPressed: () async {
                    await subtractCoin(dropValue, _amountController.text);
                    Navigator.of(context).pop();
                  },
                  child: Text("Subtract 😓",
                  selectionColor: Colors.purple,),
                  
                  color: Colors.lightGreen,
                ),
                
              ),
          ],
        ),
            ),
     
    );
  }
}
