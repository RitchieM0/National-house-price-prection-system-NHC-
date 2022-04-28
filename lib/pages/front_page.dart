import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homepricepredictor/authentication/login.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class MySlider extends StatefulWidget {
  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          child: Center(
              child: ListView(
            children: [
              SizedBox(
                height: 200.0,
                width: double.infinity,
                child: Carousel(
                  dotSize: 6.0,
                  dotSpacing: 15.0,
                  dotPosition: DotPosition.bottomCenter,
                  images: [
                    Image.asset('assets/slide1.png', fit: BoxFit.cover),
                    Image.asset('assets/slider2.jpg', fit: BoxFit.cover),
                    Image.asset('assets/slider3.jpg', fit: BoxFit.cover),
                    Image.asset('assets/slider4.jpg', fit: BoxFit.cover),
                    Image.asset('assets/slide5.png', fit: BoxFit.cover),
                    // Image.asset('assets/', fit: BoxFit.cover),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginPage()));
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.blue,
                    letterSpacing: 1.0,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 150,
              ),
            //Text Animation
              Container(
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText('WELCOME NHC',
                    textStyle: GoogleFonts.acme(
                                textStyle: TextStyle(
                                    color: Colors.blue[200],
                                       fontSize: 30,
                                    letterSpacing: 1.0),
                              ),
           
                            
                            ),
                    RotateAnimatedText('PREDICT YOUR HOME',
                        textStyle: GoogleFonts.acme(
                                textStyle: TextStyle(
                                    color: Colors.orangeAccent,
                                       fontSize: 30,
                                    letterSpacing: 3.0),
                              ),
                    
                            
                            ),
                           ///aa 
                            
                    RotateAnimatedText(
                      'NYUMBANI KUMENOGA!',
                     textStyle: GoogleFonts.acme(
                                textStyle: TextStyle(
                                    color: Colors.blue[200],
                                       fontSize: 30,
                                       decoration: TextDecoration.underline,
                                    letterSpacing: 2.0),
                                   
                              ),
                       
                            ),
                  ],
                  isRepeatingAnimation: true,
                  totalRepeatCount: 10,
                  pause: Duration(milliseconds: 1000),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
