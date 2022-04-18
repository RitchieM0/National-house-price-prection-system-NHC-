// ignore: unused_import
// ignore_for_file: missing_return

import 'dart:convert';
import 'dart:async';

// import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    this.price, 
    this.number_of_rooms,
    this.floor_area,
    this.house_Type,
    this.latitude,
    this.longitude,
  );

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
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

 class _MyAppState extends State<MyApp> {
  Future<House> futureHouse;
  final String url = "http://127.0.0.1:8000/predict";
  String stringResponse;
  List listResponse;
  Map mapResponse;

  var house_Type;

  get number_of_rooms => number_of_rooms;

  get floor_area => floor_area;

  get location => location;

  get size => size;


  @override
  void initState() {
    fetchHouse(number_of_rooms, floor_area, size, location, house_Type);
    super.initState();
  }







  Future<House> fetchHouse(number_of_rooms, floor_area, size, location, house_Type) async {
    //bro hapa ni izo parameters ambazo znatakiwa zipass kwenye api ili ilete
    // data .... sjajua kwako exactly ni zipi ila znatakiwa ziwe kama izo unazo
    // request kwenye screen pale .....

    //test na hizi parameters
    var body = {
      "number_of_rooms": ,
      "floor_area": ,
      "house_type": ,
      "latitude": ,
      "longitude": 
    };

    final response = await http.post(Uri.parse(url), body: json.encode(body));

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
    
    throw UnimplementedError();
  }
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
// gha