// ignore: unused_import
// ignore_for_file: override_on_non_overriding_member

import 'dart:collection';
import 'dart:async';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
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

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  final String state;

  const MyApp({Key key, this.state}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}

class FetchHouse {
  // Future<House> futureHouse;
  final String url = "https://nhcapi.herokuapp.com/predict";
  String location;
  List listResponse;
  Map locationDataResponse;
  Map priceResponse;
  List listOfHouse;
  fetchlocationHouse() async {}

  @override
  void initState() {
    fetchlocationHouse();
  }

  @override
  void disponse() {
    houseTypeController.clear();
    floorAreaController.clear();
    locationController.clear();
    tshController.clear();
    priceContainer = false;
  }

  Future fetchHouse() async {
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
                )),
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

    var dio = Dio();
    try {
      FormData formData = new FormData.fromMap(data);
      var responsePrice =
          await dio.post("https://nhcapi.herokuapp.com/predict", data: formData);
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


// Future<> getHousePrice() async {

//     var url = "https://nhcapi.herokuapp.com/predict";
    
//     var body = {
//       "number_of_rooms": 2,
//       "floor_area": 56,
//       "house_type": 1,
//       "latitude": -10.658900,
//       "longitude": 35.646000
//     };

//     final response = await http.post(url, headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8' }, 
//             body: json.encode(body));

//     if (response.statusCode == 200) {
//       print('response: ' + response.body);
      
//       return HousePrice.fromJson(json.decode(response.body));
//     } else {
//       print('failed to get data');
//       throw Exception('Failed to get data');
//     }
//   }