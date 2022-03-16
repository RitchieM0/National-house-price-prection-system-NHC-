// ignore: unused_import
// ignore_for_file: override_on_non_overriding_member

import 'dart:collection';
import 'dart:convert';
import 'dart:async';

<<<<<<< Updated upstream
// import 'package:flutter/material.dart';
=======
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
>>>>>>> Stashed changes
import 'package:http/http.dart' as http;

// ignore: unused_import
import '../main.dart';

class House {
  int number_of_rooms;
  double floor_area;
  int house_Type;
  double latitude;
  double longitude;
  String price;

  House(
    this.price, {
    this.number_of_rooms,
    this.floor_area,
    this.house_Type,
    this.latitude,
    this.longitude,
  });

  fromJson(Map<String, dynamic> json) {
    number_of_rooms = json['number_of_rooms'];
    floor_area = json['floor_area'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    price = json['price'];
    house_Type = json['house_Type'];
  }
}

<<<<<<< Updated upstream
// void main() => runApp(MyApp());
//
// class MyApp extends StatefulWidget {
//   MyApp({Key key}) : super(key: key);
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
=======
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  final String state;

  const MyApp({Key key, this.state}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}
>>>>>>> Stashed changes

class FetchHouse {
  // Future<House> futureHouse;
  final String url = "http://127.0.0.1:8000/predict";
  String location;
  List listResponse;
  Map locationDataResponse;
  Map priceResponse;
  List listOfHouse;
  fetchlocationHouse() async {
    location = widget.state;
    http.Response locationData = await http.get(url);
    setState(() {
      locationDataResponse = jsonDecode(locationData.body);
    });
  }

<<<<<<< Updated upstream
  
  Future fetchHouse() async {
    final response = await http
        .post(Uri.parse('http://127.0.0.1:8000/predict'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future fetchHouses() async {
=======
  @override
  void initState() {
    fetchlocationHouse();
    super.initState();
  }

  @override
  void disponse() {
    houseTypeController.clear();
    floorAreaController.clear();
    locationController.clear();
    tshController.clear();
    priceContainer = false;
    super.dispose();
  }

  @override
  // Widget build(BuildContext context) {
  //   return locationDataResponse == null
  //       ? Center(
  //           child: CircularProgressIndicator(),
  //         )
  //       : Container(
  //           child: Form(
  //             key: formKey,
  //             child: Column(
  //               children: <Widget>[
  //                 Padding(
  //                   padding: const EdgeInsets.all(15.0),
  //                   child: DropDownField(
  //                     controller: locationController,
  //                     hintText: "Select Location",
  //                     enabled: true,
  //                     itemsVisibleInDropdown: 5,
  //                     items: locationDataResponse["locations"].cast<String>(),
  //                     onValueChanged: (value) {
  //                       setState(() {
  //                         selectedCity = value;
  //                       });
  //                     },
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(
  //                       left: 15, right: 20, top: 10, bottom: 15),
  //                   child: TextFormField(
  //                     decoration: InputDecoration(
  //                       labelText: "room",
  //                       border: OutlineInputBorder(
  //                           borderRadius: BorderRadius.circular(25.0),
  //                           borderSide: BorderSide()),
  //                       hintText: 'NO. OF ROOM',
  //                     ),
  //                     controller: roomController,
  //                     keyboardType: TextInputType.number,
  //                     validator: (bathNum) {
  //                       if (bathNum.isEmpty) {
  //                         return "VALUE CANNOT BE EMPTY";
  //                       }
  //                       if (bathNum.contains(".")) {
  //                         return "NUMBER OF ROOM CANNOT BE IN DECIMAL";
  //                       }
  //                       if (int.parse(bathNum) < 0 || int.parse(bathNum) > 5) {
  //                         return "NO. OF ROOM CANNOT BE LESS THAN 0 OR GREATER THAN 5";
  //                       }
  //                       return null;
  //                     },
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(
  //                       left: 15, right: 20, top: 10, bottom: 15),
  //                   child: TextFormField(
  //                     decoration: InputDecoration(
  //                       labelText: "SQFT",
  //                       border: OutlineInputBorder(
  //                           borderRadius: BorderRadius.circular(25.0),
  //                           borderSide: BorderSide()),
  //                       hintText: 'ENTER TOTAL SQFT',
  //                     ),
  //                     controller: roomController,
  //                     keyboardType: TextInputType.number,
  //                     validator: (totalSqft) {
  //                       if (totalSqft.isEmpty) {
  //                         return "VALUE CANNOT BE EMPTY";
  //                       }
  //                       if (totalSqft.contains(".")) {
  //                         return "SQFT CANNOT BE IN DECIMAL";
  //                       }
  //                       if (int.parse(totalSqft) < 300 ||
  //                           int.parse(totalSqft) > 50000) {
  //                         return "TOTAL CANNOT BE LESS THAN 0 OR GREATER THAN 50000 SQFT";
  //                       }
  //                       return null;
  //                     },
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(
  //                       left: 15, right: 20, top: 10, bottom: 15),
  //                   child: TextFormField(
  //                     decoration: InputDecoration(
  //                       labelText: "TSH",
  //                       border: OutlineInputBorder(
  //                           borderRadius: BorderRadius.circular(25.0),
  //                           borderSide: BorderSide()),
  //                       hintText: 'NO. OF BHK',
  //                     ),
  //                     controller: tshController,
  //                     keyboardType: TextInputType.number,
  //                     validator: (bathNum) {
  //                       if (bathNum.isEmpty) {
  //                         return "VALUE CANNOT BE EMPTY";
  //                       }
  //                       if (bathNum.contains(".")) {
  //                         return "NUMBER OF BATHROOM CANNOT BE IN DECIMAL";
  //                       }
  //                       if (int.parse(bathNum) < 0 || int.parse(bathNum) > 5) {
  //                         return "NO. OF BATHROOM CANNOT BE LESS THAN 0 OR GREATER THAN 5";
  //                       }
  //                       return null;
  //                     },
  //                   ),
  //                 ),
  //                 priceContainer
  //                     ? Text(
  //                         "Price : " +
  //                             'Tsh ' +
  //                             price['estimated_price'].toString() +
  //                             ' TSH',
  //                         style: TextStyle(fontSize: 25),
  //                       )
  //                     : Container(),
  //                 circular
  //                     ? CircularProgressIndicator()
  //                     : ElevatedButton(
  //                         child: Text(
  //                           "SUBMIT",
  //                           style: TextStyle(color: Colors.white),
  //                         ),
  //                         onPressed: () async {
  //                           setState(() {
  //                             circular = true;
  //                             priceContainer = false;
  //                           });
  //                           await getPrice();
  //                           setState(() {
  //                             circular = false;
  //                             if (price['estimated_price']
  //                                 .toString()
  //                                 .isNotEmpty) {
  //                               priceContainer = true;
  //                             } else {
  //                               priceContainer = false;
  //                             }
  //                           });
  //                         },
  //                       )
  //               ],
  //             ),
  //           ),
  //         );
  // }
  Future fetchHouse() async {
>>>>>>> Stashed changes
    var response = await http
        .post(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    print(response.body);

    // ignore: unused_element

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load House ');
    }
  }
<<<<<<< Updated upstream
}

// class _MyAppState extends State<MyApp> {
//   Future<House> futureHouse;
//   final String url = "http://127.0.0.1:8000/predict";
//   String stringResponse;
//   List listResponse;
//   Map mapResponse;
//   List listOfHouse;
//
//   @override
//   void initState() {
//     futureHouse = fetchHouse();
//     super.initState();
//   }
//
//   Future fetchHouse() async {
//     var response = await http
//         .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
//
//     print(response.body);
//
//     // ignore: unused_element
//
//     if (response.statusCode == 200) {
//       // If the server did return a 200 OK response,
//       // then parse the JSON.
//
//     } else {
//       // If the server did not return a 200 OK response,
//       // then throw an exception.
//       throw Exception('Failed to load House ');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // title: 'Fetching Data',
//       // theme: ThemeData(
//       //   primarySwatch: Colors.blue,
//       // ),
//       home: Scaffold(
//           body: mapResponse == null
//               ? Container()
//               : Column(
//                   children: [
//                     Text(
//                       mapResponse['price'].toString(),
//                       style: TextStyle(fontSize: 30),
//                     ),
//                     ListView.builder(
//                       itemBuilder: (context, index) {
//                         return Container(
//                           child: new Center(
//                             child: new Column(
//                               crossAxisAlignment: CrossAxisAlignment.stretch,
//                               children: [
//                                 new Card(
//                                   child: new Container(
//                                     child:
//                                         new Text(listOfHouse[index]['price']),
//                                     padding: const EdgeInsets.all(20),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                       itemCount: listOfHouse == null ? 1 : listOfHouse.length,
//                     )
//                   ],
//                 )
//
//           // body:  Center(
//           //     child: FutureBuilder<House>(
//
//           //       builder: (context, snapshot) {
//           //         if (snapshot.hasData) {
//           //           return Text(snapshot.data.price);
//           //         } else if (snapshot.hasError) {
//           //           return Text("${snapshot.error}");
//           //         }
//           //         return CircularProgressIndicator();
//           //       },
//           //     ),
//           //   ),
//           ),
//     );
//   }
// }
=======

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Fetching Data',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: Scaffold(
          body: locationDataResponse == null
              ? Container()
              : Column(
                  children: [
                    Text(
                      locationDataResponse['price'].toString(),
                      style: TextStyle(fontSize: 30),
                    ),
                    ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          child: new Center(
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                new Card(
                                  child: new Container(
                                    child:
                                        new Text(listOfHouse[index]['price']),
                                    padding: const EdgeInsets.all(20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: listOfHouse == null ? 1 : listOfHouse.length,
                    )
                  ],
                )

          // body:  Center(
          //     child: FutureBuilder<House>(

          //       builder: (context, snapshot) {
          //         if (snapshot.hasData) {
          //           return Text(snapshot.data.price);
          //         } else if (snapshot.hasError) {
          //           return Text("${snapshot.error}");
          //         }
          //         return CircularProgressIndicator();
          //       },
          //     ),
          //   ),
          ),
    );
  }
}

Future<void> getPrice() async {
  if (formKey.currentState.validate() && locationController.text.isNotEmpty) {
    print("Correct");
    Map<String, String> data = {
      "number_of_room": roomController.text,
      "location": locationController.text,
      "Tsh": tshController.text,
      "floor_area": floorAreaController.text,
      "house_Type": houseTypeController.text
    };
    print(data);
    // var response = await http.post("http://192.168.0.102:5000/predict_home_price_Bangalore" , body : jsonEncode(data));
    // print(response.body);
    var dio = Dio();
    try {
      FormData formData = new FormData.fromMap(data);
      var responsePrice =
          await dio.post("http://127.0.0.1:8000/predict", data: formData);
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
final floorAreaController = TextEditingController();
final roomController = TextEditingController();
final tshController = TextEditingController();
final houseTypeController = TextEditingController();
final formKey = GlobalKey<FormState>();
String selectedCity = "";
>>>>>>> Stashed changes
