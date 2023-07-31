// ignore_for_file: non_constant_identifier_names
import 'dart:async';
import 'dart:typed_data';
//import 'dart:html';
import 'dart:ui';
import 'package:crypto_pocket/ui/profile_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import '../net/flutterfire_function.dart';
import 'package:crypto_pocket/ui/homeView.dart';
import '../global.dart' as global;
import '../resources/add_data.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // ignore: non_constant_identifier_names
  final TextEditingController _EmailFeild = TextEditingController();
  final TextEditingController _PasswordFeild = TextEditingController();
  final TextEditingController _UserNameFeild = TextEditingController();
  bool isLoading = false;
  bool isLoading2 = false;
  bool _showMessage = false;
  Uint8List? _image;

  void _onPressed_for_message() {
    setState(() {
      _showMessage = true;
      Timer(Duration(seconds: 3), () {
        setState(() {
          _showMessage = false;
        });
      });
    });
  }

  User? user = FirebaseAuth.instance.currentUser;

  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    // _file will contain 3 info size, type, address
    if (_file != null) {
      return await _file.readAsBytes();
    }
    print("No image is selected");
  }

  void SelectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
     
    });
  }

  void saveProfile() async {
    String _name = _UserNameFeild.text;
    String Resp = await StoreData().saveData(file: _image!, name: _name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Register",
            style: TextStyle(color: Colors.orange),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 40, 53, 147)
          ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                child: Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 66,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : CircleAvatar(
                            radius: 66,
                            backgroundImage: NetworkImage(
                                "https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png"),
                          ),
                    Positioned(
                      child: IconButton(
                        icon: Icon(Icons.add_a_photo),
                        onPressed: SelectImage,
                      ),
                      bottom: -10,
                      left: 80,
                    )
                  ],
                ),
              ),
              BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                child: Container(
                  decoration:
                      new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  child: Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: _UserNameFeild,
                            // ignore: prefer_const_constructors
                            decoration: InputDecoration(
                              hintText: "username",
                              // ignore: prefer_const_constructors
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              labelText: "username",
                              // ignore: prefer_const_constructors
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 35,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: _EmailFeild,
                            // ignore: prefer_const_constructors
                            decoration: InputDecoration(
                              hintText: "abc@email.com",
                              // ignore: prefer_const_constructors
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              labelText: "Email",
                              // ignore: prefer_const_constructors
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 35,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: _PasswordFeild,
                            obscureText: true,
                            //obscure text is used to hide what you put input as a password
                            // ignore: prefer_const_constructors
                            decoration: InputDecoration(
                              hintText: "Password",
                              // ignore: prefer_const_constructors
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              labelText: "Password",
                              // ignore: prefer_const_constructors
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 35,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.3),
                            color: Colors.redAccent,
                          ),
                          child: MaterialButton(
                              highlightColor: Colors.red[900],
                              onPressed: () async {
                                bool shouldNavigate = await register(
                                    _EmailFeild.text,
                                    _PasswordFeild.text,
                                    _UserNameFeild.text);
                                  saveProfile();
                                if (shouldNavigate) {
                                  //navigate
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeView(),
                                    ),
                                  );
                                } else {
                                  setState(() {
                                    _showMessage = true;
                                    Timer(Duration(seconds: 3), (() {
                                      setState(() {
                                        _showMessage = false;
                                      });
                                    }));
                                  });
                                }
                                if (isLoading2) return;
                                setState(
                                  () {
                                    isLoading2 = true;
                                  },
                                );
                                await Future.delayed(Duration(seconds: 3));
                                setState(
                                  () {
                                    isLoading2 = false;
                                  },
                                );
                              },
                              child: isLoading2
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                          CircularProgressIndicator(
                                            color: Colors.yellow,
                                          ),
                                          SizedBox(
                                            width: 24.0,
                                          ),
                                          Text(
                                            "Please wait...",
                                            style:
                                                TextStyle(color: Colors.orange),
                                          )
                                        ])
                                  : Text(
                                      "Register",
                                      style: TextStyle(color: Colors.yellow),
                                    )),
                        ),
                        const SizedBox(height: 15.0),
                        if (_showMessage)
                          Text(
                            global.error,
                            style:
                                TextStyle(fontSize: 18, color: Colors.orange),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
