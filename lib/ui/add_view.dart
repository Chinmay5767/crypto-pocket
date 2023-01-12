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
    return Material(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              icon: Icon(
               Icons.money_off_csred_outlined,
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
                   child: Text(value),
                  value: value,
                  
                 
                );
              }).toList(),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                controller: _amountController,
                decoration: InputDecoration(
                  labelText: "coin amount 💸",
                  fillColor: Colors.lightGreen,
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
                child: Text("Subtract 😓"),
                color: Colors.lightGreen,
              ),
              
            ),
          ],
        ),
     
    );
  }
}
