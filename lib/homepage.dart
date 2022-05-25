import 'package:flutter/material.dart';
import 'package:homepricepredictor/Utils/common.dart';
import 'package:homepricepredictor/Utils/constants.dart';
import 'package:homepricepredictor/services/google_places.dart';
import 'package:homepricepredictor/widgets/custom_dialog.dart';
import 'package:homepricepredictor/widgets/locationsearch.dart';
import 'package:homepricepredictor/widgets/map_routes.dart';
import 'package:provider/src/provider.dart';
import 'package:uuid/uuid.dart';
import 'authentication/authentication_services.dart';
import 'models/house.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController valid = TextEditingController();
  final _locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  bool value = false;
  int val = -1;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    
    final inputs = Padding(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: _locationController,
              onTap: () async {
                final sessionToken = Uuid().v4();
                final Suggestion result = await showSearch(
                  context: context,
                  delegate: LocationSearch(sessionToken),
                );

                if (result != null) {
                  setState(() {
                    _locationController.text = result.description;
                  });
                }
              },
              validator: (locationSqft) {
                if (locationSqft.isEmpty) {
                  return "VALUE CANNOT BE EMPTY";
                }

                return null;
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15),
                labelText: "Location",
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                      color: Colors.white, width: 1, style: BorderStyle.solid),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                      color: Colors.black, width: 1, style: BorderStyle.solid),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: TextFormField(
                controller: valid,
                keyboardType: TextInputType.number,
                validator: (roomNum) {
                  if (roomNum.isEmpty) {
                    return "VALUE CANNOT BE EMPTY";
                  }
                  if (roomNum.contains(".")) {
                    return "NUMBER OF ROOM CANNOT BE IN DECIMAL";
                  }
                  if (int.parse(roomNum) < 0 || int.parse(roomNum) > 5) {
                    return "NO. OF ROOM CANNOT BE LESS THAN 0 OR GREATER THAN 5";
                  }
                  return null;
                },
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
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: TextFormField(
                keyboardType: TextInputType.number,
                validator: (totalSqft) {
                  if (totalSqft.isEmpty) {
                    return "VALUE CANNOT BE EMPTY";
                  }

                  return null;
                },
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

            ElevatedButton(
              child: Text(
                "send request",
                style: TextStyle(
                  color: Colors.cyanAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                
                FetchHouse()
                    .getHousePrice()
                    .then((value) => {
                      Common().showToast(context, value),
                      showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialogBox(
                          title: "House Price",
                          descriptions: value.toString(),
                          text: "Ok",
                        );
                      })
                      
                    });

                    if (value != "Error") {
                  
                  // navigate to the map page
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => FlutterAnimarkerExample()),
                  // );
                }
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                  textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 20),
                  )),
            ),

            //my own
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              onPressed: () {
                setState(() {
                  isLoading = true;
                });

                // we had used future delayed to stop loading after
                // 3 seconds and show text "submit" on the screen.
                Future.delayed(const Duration(seconds: 3), () {
                  setState(() {
                    isLoading = false;
                  });
                  print(isLoading);
                });
              },
              child: isLoading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Loading...',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ],
                    )
                  : const Text('Submit'),
            )
          ],
        ),
      ),
    );

    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.asset('assets/nhc2.png',
                  width: 110.0, height: 120.0, fit: BoxFit.cover),
            ),
            Container(
              child: Column(
                children: [
                  // Text('For more inquiries consider the contacts below'),
                  ListTile(
                    leading: Icon(Icons.phone_android),
                    title: Text("PHONE: 0621235166"),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('person information'),
                  ),
                  ListTile(
                    leading: Icon(Icons.mark_email_read_rounded),
                    title: Text('EMAIL: nhcpriceprediction@gmail.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.maps_home_work_sharp),
                    title: Text('14113 kijitonyama Dar es salaam Tanzania'),
                  ),
                  ListTile(
                    leading: Icon(Icons.add_comment_rounded),
                    title: Text('About-us'),
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                    onTap: () {
                      context.read<AuthenticationService>().signOut();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: AppBar(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20))),
            backgroundColor: Colors.blueAccent[100],
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
      body: SingleChildScrollView(
        child: Column(
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
                                color: Colors.greenAccent[100],
                                offset: Offset(4.5, 5.5),
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
      ),
    );
  }
}
