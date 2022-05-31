import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login UI',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Login UI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loggedin = false;
  late TextEditingController name = TextEditingController();
  late TextEditingController password = TextEditingController();
  late String data = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        decoration: const BoxDecoration(
          color: background,
          // gradient: LinearGradient(colors: [
          //   Color.fromARGB(31, 14, 13, 13),
          //   Colors.black,
          //   Colors.black,
          //   Colors.black
          // ]),
          // const BoxDecoration(color: Color(0xff191414)
        ),
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                child: Image.asset(
                  'assets/spotify-logo.png',
                  fit: BoxFit.contain,
                  height: 140,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Spotify",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 42),
              ),
              const SizedBox(
                height: 20,
              ),
              StyledTextField(
                placeHolder: "Username",
                value: name,
              ),
              const SizedBox(
                height: 7,
              ),
              StyledTextField(
                placeHolder: "Password",
                value: password,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                  ),
                  const TextWhite(text: "Forgot Password?")
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              StyledButton(
                // method 1: function defined here
                onPressed: () {
                  return "${name.text} just logged in";
                },
                data: data,

                //method 2: function defined in the other file
                // onPressed: (String data) => {},

                child: const Text(
                  "Sign in",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextGreen(text: "Be Correct With"),
              const SizedBox(
                height: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.facebook,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Icon(
                    Icons.mail,
                    color: Colors.white,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  TextWhite(text: "Don't have an account"),
                  SizedBox(
                    width: 3,
                  ),
                  TextGreen(text: "Sign Up")
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          )
        ]),
      )),
    );
  }
}
