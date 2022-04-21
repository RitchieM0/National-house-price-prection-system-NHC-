// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homepricepredictor/authentication/signup.dart';

import 'package:provider/provider.dart';
import 'authentication_services.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _secureText = true;

  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Login Page",
                      style: GoogleFonts.acme(
                        textStyle: TextStyle(
                          color: Colors.blue[200],
                          letterSpacing: 1.0,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Welcome Create your Account",
                      style: GoogleFonts.acme(
                        textStyle: TextStyle(
                            color: Color.fromARGB(255, 95, 95, 224),
                            letterSpacing: 1.0),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(Icons.email),
                            onPressed: () {},
                          ),
                          label: Text(
                            "Email",
                            style: GoogleFonts.acme(
                              textStyle: TextStyle(
                                  color: Color.fromARGB(255, 29, 29, 37),
                                  letterSpacing: 1.0),
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        obscureText: _secureText,
                        controller: passwordController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(_secureText
                                ? Icons.remove_red_eye
                                : Icons.security),
                            onPressed: () {
                              setState(() {
                                _secureText = !_secureText;
                              });
                            },
                          ),
                          label: Text(
                            "Password",
                            style: GoogleFonts.acme(
                              textStyle: TextStyle(
                                  color: Color.fromARGB(255, 29, 29, 37),
                                  letterSpacing: 1.0),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(),
                    ),
                    child: Container(
                      child: MaterialButton(
                        minWidth: 150,
                        height: 40,
                        onPressed: () {
                          context.read<AuthenticationService>().signIn(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                        },
                        color: Color.fromARGB(255, 29, 80, 189),
                        // elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          "Login",
                          style: GoogleFonts.acme(
                            textStyle: TextStyle(
                                color: Colors.blue, letterSpacing: 1.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      autofocus: true,
                      child: Text(
                        "Create Account (Sign Up)",
                        style: GoogleFonts.fahkwang(
                          textStyle: TextStyle(
                            color: Color.fromARGB(255, 105, 105, 204),
                            letterSpacing: 1.0,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  
}




// we will be creating a widget for text field
Widget inputFile({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow))),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}
