import 'package:crypto_pocket/ui/add_view.dart';
import 'package:crypto_pocket/ui/homeView.dart';
import 'package:crypto_pocket/ui/prices.dart';
import 'package:crypto_pocket/ui/profile_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:crypto_pocket/ui/authentication.dart';

void main() async {
  Text("wait");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Wallet',
      home: Authentication(),
    );
  }
}
