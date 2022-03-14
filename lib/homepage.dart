// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
// import 'dart:convert';

// import 'package:http/http.dart' as http;
// ignore: unused_import
import 'models/house.dart';

// import 'package:homepricepredictor/widgets/state_panel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Future<House> futureHouse;
  TextEditingController valid = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  bool value = false;
  int val = -1;
  @override
  Widget build(BuildContext context) {
    final inputs = Padding(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15),
              labelText: "Location",
              labelStyle: TextStyle(color: Colors.white),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                      color: Colors.white, width: 1, style: BorderStyle.solid)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                      color: Colors.black, width: 1, style: BorderStyle.solid)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: TextFormField(
              controller: valid,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15),
                labelText: "Number of rooms",
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                        style: BorderStyle.solid)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid)),
              ),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15),
              labelText: "Area",
              labelStyle: TextStyle(color: Colors.white),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                      color: Colors.white, width: 1, style: BorderStyle.solid)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                      color: Colors.black, width: 1, style: BorderStyle.solid)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                labelText: "Metric",
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                        style: BorderStyle.solid)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid)),
              ),
            ),
          ),
          Text(
            'HOUSE TYPE',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromRGBO(25, 0, 0, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            child: Column(
              children: [
                ListTile(
                  title: Text("Apartment"),
                  leading: Radio(
                    value: 1,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = value;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                ),
                ListTile(
                  title: Text("Normal"),
                  leading: Radio(
                    value: 2,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = value;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                ),
              ],
            ),
          ),

          // send request button
          GestureDetector(
            onTap: () {},
            child: ElevatedButton(
              // ignore: sdk_version_set_literal

              child: Text(
                "send request",
                style: TextStyle(
                  color: Colors.cyanAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                MyApp();
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                  textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 20),
                  )),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: AppBar(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20))),
            backgroundColor: Colors.yellowAccent[400],
            title: Text(
              "⭐Welcome, send your request now!!⭐",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: inputs,
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.lightBlue[100],
                              offset: Offset(3.5, 5.5),
                              spreadRadius: 1,
                              blurRadius: 5)
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
