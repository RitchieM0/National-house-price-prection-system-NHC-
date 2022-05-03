import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class Formwidget extends StatefulWidget {
  final String state;

  const Formwidget({Key key, this.state}) : super(key: key);

  @override
  _FormwidgetState createState() => _FormwidgetState();
}

class _FormwidgetState extends State<Formwidget> {
  // Future<void> getPrice() async {
  //   var response = await http.post("" , body : jsonEncode({""}) , headers : {"content-type" : "application/json" });
  //   print(response.body);
  // }

  String location;
  Map locationDataBangalore;
  fetchlocationData() async {
    location = widget.state;
    http.Response locationData = await http.get(
        "https://housepricepredictionapiv1.herokuapp.com//get_location_names_$location");
    setState(() {
      locationDataBangalore = jsonDecode(locationData.body);
    });
    //print(locationDataBangalore['locations']);
  }

  @override
  void initState() {
    fetchlocationData();
    super.initState();
  }

  @override
  void dispose() {
    locationController.clear();
    bathroomController.clear();
    totalSqftController.clear();
    bhkController.clear();
    priceContainer = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return locationDataBangalore == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    // child: DropDownField(
                    //   controller: locationController,
                    //   hintText: "Select Location",
                    //   enabled: true,
                    //   itemsVisibleInDropdown: 5,
                    //   items: locationDataBangalore["locations"].cast<String>(),
                    //   onValueChanged: (value) {
                    //     setState(() {
                    //       selectedCity = value;
                    //     });
                    //   },
                    // ),
                    child: DropdownButton(
                      value: selectedCity,
                      hint: Text("Select Location"),
                      items: locationDataBangalore["location"].cast<String>(),
                      onChanged: (String value){
                        setState(() {
                          selectedCity = value;
                        });
                      },
                      
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 20, top: 10, bottom: 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Bathroom",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide()),
                        hintText: 'NO. OF BATHROOM',
                      ),
                      controller: bathroomController,
                      keyboardType: TextInputType.number,
                      validator: (bathNum) {
                        if (bathNum.isEmpty) {
                          return "VALUE CANNOT BE EMPTY";
                        }
                        if (bathNum.contains(".")) {
                          return "NUMBER OF BATHROOM CANNOT BE IN DECIMAL";
                        }
                        if (int.parse(bathNum) < 0 || int.parse(bathNum) > 5) {
                          return "NO. OF BATHROOM CANNOT BE LESS THAN 0 OR GREATER THAN 5";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 20, top: 10, bottom: 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "SQFT",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide()),
                        hintText: 'ENTER TOTAL SQFT',
                      ),
                      controller: totalSqftController,
                      keyboardType: TextInputType.number,
                      validator: (totalSqft) {
                        if (totalSqft.isEmpty) {
                          return "VALUE CANNOT BE EMPTY";
                        }
                        if (totalSqft.contains(".")) {
                          return "SQFT CANNOT BE IN DECIMAL";
                        }
                        if (int.parse(totalSqft) < 300 ||
                            int.parse(totalSqft) > 50000) {
                          return "TOTAL CANNOT BE LESS THAN 0 OR GREATER THAN 50000 SQFT";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 20, top: 10, bottom: 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "BHK",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide()),
                        hintText: 'NO. OF BHK',
                      ),
                      controller: bhkController,
                      keyboardType: TextInputType.number,
                      validator: (bathNum) {
                        if (bathNum.isEmpty) {
                          return "VALUE CANNOT BE EMPTY";
                        }
                        if (bathNum.contains(".")) {
                          return "NUMBER OF BATHROOM CANNOT BE IN DECIMAL";
                        }
                        if (int.parse(bathNum) < 0 || int.parse(bathNum) > 5) {
                          return "NO. OF BATHROOM CANNOT BE LESS THAN 0 OR GREATER THAN 5";
                        }
                        return null;
                      },
                    ),
                  ),
                  priceContainer
                      ? Text(
                          "Price : " +
                              'Tsh ' +
                              price['estimated_price'].toString() +
                              ' LAKH',
                          style: TextStyle(fontSize: 25),
                        )
                      : Container(),
                  circular
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            setState(() {
                              circular = true;
                              priceContainer = false;
                            });
                            await getPrice();
                            setState(() {
                              circular = false;
                              if (price['estimated_price']
                                  .toString()
                                  .isNotEmpty) {
                                priceContainer = true;
                              } else {
                                priceContainer = false;
                              }
                            });
                          },
                        )
                ],
              ),
            ),
          );
  }
}

Future<void> getPrice() async {
  if (formKey.currentState.validate() && locationController.text.isNotEmpty) {
    print("Correct");
    Map<String, String> data = {
      "total_sqft": totalSqftController.text,
      "location": locationController.text,
      "bhk": bhkController.text,
      "bath": bathroomController.text,
    };
    print(data);
    // var response = await http.post("http://192.168.0.102:5000/predict_home_price_Bangalore" , body : jsonEncode(data));
    // print(response.body);
    var dio = Dio();
    try {
      FormData formData = new FormData.fromMap(data);
      var responsePrice = await dio.post(
          "https://housepricepredictionapiv1.herokuapp.com/predict_home_price_Bangalore",
          data: formData);
      print(responsePrice.data);
      price = responsePrice.data;
    } catch (error) {
      print(error);
    }
  }
}

Map data;
bool circular = false;
bool priceContainer = false;
LinkedHashMap price;
final locationController = TextEditingController();
final bathroomController = TextEditingController();
final totalSqftController = TextEditingController();
final bhkController = TextEditingController();
final formKey = GlobalKey<FormState>();
String selectedCity = "";
String numBath = "";
