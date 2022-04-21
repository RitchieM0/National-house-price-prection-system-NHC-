import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'authentication_services.dart';
class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
    final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userController = TextEditingController();
   bool _secureText = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                   Text(
                    "Sign up",
                   style: GoogleFonts.acme(
            textStyle: TextStyle(color: Colors.blue[200], letterSpacing: 1.0,
            fontSize: 28,
            fontWeight:FontWeight.bold,
            ),
                      ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create an account, It's free ",
                    style: GoogleFonts.acme(
            textStyle: TextStyle(color: Color.fromARGB(255, 98, 100, 204), letterSpacing: 1.0),
                      ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                   TextField(
                    controller: userController,
                    decoration: InputDecoration(
                      label: Text("Username",
                    
                      style: GoogleFonts.acme(
            textStyle: TextStyle(color: Color.fromARGB(255, 30, 30, 41), letterSpacing: 1.0),
                      ),
                      ),
                    ),
                  ),

                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      label: Text("Email",
                      style: GoogleFonts.acme(
            textStyle: TextStyle(color: Color.fromARGB(255, 30, 30, 41), letterSpacing: 1.0),
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
                      label: Text("Password",
                      style: GoogleFonts.acme(
            textStyle: TextStyle(color: Color.fromARGB(255, 21, 21, 31), letterSpacing: 1.0),
                      ),
                    ),
                  ),),
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
                      label: Text("Repeat Password",
                      style: GoogleFonts.acme(
            textStyle: TextStyle(color: Color.fromARGB(255, 21, 21, 31), letterSpacing: 1.0),
                      ),
                    ),
                  ),),

                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(),
                
                    ),
                child: MaterialButton(
                  minWidth: 150,
                  height: 40,
                  onPressed: () {
                    context.read<AuthenticationService>().signUp(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                  },
                  color: Color.fromARGB(255, 19, 84, 145),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Sign up",
                   style: GoogleFonts.acme(
            textStyle: TextStyle(color: Colors.blue, letterSpacing: 1.0),
          ),
                  ),
                ),
              ),
              SizedBox(
                width: 700,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  <Widget>[
                    Text("Already have an account?",
                    style: GoogleFonts.acme(
            textStyle: TextStyle(color: Color.fromARGB(255, 98, 100, 204), letterSpacing: 1.0),
                      ),
                      ),
                   
                  ],

                ),
              ),
               
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, 
                    child: Text("Login",
                  style: TextStyle(color: Colors.blue, letterSpacing: 1.0,
                  fontSize:16,
                  fontWeight: FontWeight.bold,),
                      ),)
            ],
          ),
        ),
      ),
    );
  }

}






