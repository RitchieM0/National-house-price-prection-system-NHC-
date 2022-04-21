import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homepricepredictor/widgets/formWidget.dart';

class FlutterAnimarkerExample extends StatefulWidget {
  @override
  _FlutterAnimarkerExampleState createState() =>
      _FlutterAnimarkerExampleState();
}

class _FlutterAnimarkerExampleState extends State<FlutterAnimarkerExample> {
  LatLng pinPosition = LatLng(-6.8044189, 39.2866739);
  LatLng pinPosition1 = LatLng(-6.200000, 36.417000);
  LatLng pinPosition2 = LatLng(-10.642500, 35.631700);
  LatLng pinPosition3 = LatLng(-10.658900, 35.646000);
  LatLng pinPosition4 = LatLng(-5.900000, 37.400000);
  LatLng pinPosition5 = LatLng(-9.239100, 33.379500);
  LatLng pinPosition6 = LatLng(-4.871900, 29.643100);
  LatLng pinPosition7 = LatLng(-6.302900, 37.444600);
  LatLng pinPosition8 = LatLng(-4.210000, 35.770000);
  LatLng pinPosition9 = LatLng(-9.981900, 39.699600);
  LatLng pinPosition10 = LatLng(-4.283330, 33.883330);
  LatLng pinPosition11 = LatLng(-3.842300, 32.581400);
  LatLng pinPosition12 = LatLng(-10.727200, 38.800600);
  LatLng pinPosition24 = LatLng(-6.725500, 32.055300);
  LatLng pinPosition13 = LatLng(-1.500000, 33.800000);
  LatLng pinPosition14 = LatLng(-9.207300, 34.064100);
  LatLng pinPosition15 = LatLng(-8.351900, 34.331000);
  LatLng pinPosition16 = LatLng(-2.732200, 36.695500);
  LatLng pinPosition17 = LatLng(-5.088800, 39.102300);
  LatLng pinPosition18 = LatLng(-1.895500, 31.537000);
  LatLng pinPosition19 = LatLng(-5.145600, 33.348600);
  LatLng pinPosition20 = LatLng(-3.302900, 36.445300);
  LatLng pinPosition21 = LatLng(-8.148100, 33.259400);
  LatLng pinPosition22 = LatLng(-2.978500, 31.719500);
  LatLng pinPosition23 = LatLng(-2.515400, 32.973600);
  LatLng pinPosition28 = LatLng(-10.265800, 40.184600);
  LatLng pinPosition25 = LatLng(-7.948900, 31.616900);
  LatLng pinPosition26 = LatLng(-3.447000, 36.674100);
  LatLng pinPosition27 = LatLng(-3.239300, 36.762700);
  LatLng pinPosition29 = LatLng(-6.181100, 35.763800);
  LatLng pinPosition30 = LatLng(-6.864000, 39.388000);
  LatLng pinPosition31 = LatLng(-6.7962044762950224, 39.26934461265225);
  LatLng pinPosition32 = LatLng(-6.792500, 39.208700);
  LatLng pinPosition33 = LatLng(-6.808087, 39.276505);
  LatLng pinPosition34 = LatLng(-6.820800, 39.263300);
  LatLng pinPosition35 = LatLng(-6.779000, 39.253400);
  LatLng pinPosition36 = LatLng(-6.7730453754668885, 39.26162792703885);
  LatLng pinPosition37 = LatLng(-6.73815621476203, 39.23688586872349);
  LatLng pinPosition38 = LatLng(-6.2056925754351475, 35.83576749936743);
  LatLng pinPosition39 = LatLng(-10.281000, 40.180200);
  LatLng pinPosition40 = LatLng(-6.773297375477286, 39.260999754298986);

  final double _zoom = 11.5;
  BitmapDescriptor pinPositionIcon;
  Set<Marker> _markers = Set();

  void _addMarkers() async {
    pinPositionIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(
        devicePixelRatio: 2.5,
      ),
      'assets/hous.png',
    );

    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(
                title: "NATIONAL HOUSE HQ",
                snippet: "WELCOME predict your Home!!"),
                    
            position: pinPosition),
      );
    });
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("marker_id1"),
          icon: pinPositionIcon,
          infoWindow: InfoWindow(title: "Location: Kongwa", snippet: "price: $price"),
        
          position: pinPosition1,
        ),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id2"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition2),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id3"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition3),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id4"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition4),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id11"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition11),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id5"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition5),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id6"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition6),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id7"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition7),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id8"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition8),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id9"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition9),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id10"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition10),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id12"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition12),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id13"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition13),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id14"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition14),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id15"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition15),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id16"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition16),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id17"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition17),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id18"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition18),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id19"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition19),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id20"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition20),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id21"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition21),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id22"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition22),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id23"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition23),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id24"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition24),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id25"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition25),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id26"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition26),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id27"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition27),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id28"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition28),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id29"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition29),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id30"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition30),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id31"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "Location: KINONDONI", snippet: ""),
            position: pinPosition31),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id32"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition32),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id33"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition33),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id34"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "", snippet: ""),
            position: pinPosition34),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id35"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "Location: VICTORIA PLACE", snippet: ""),
            position: pinPosition35),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id36"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "location: MOROCCO SQUARE", snippet: ""),
            position: pinPosition36),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id37"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "Location: KAWE", snippet: ""),
            position: pinPosition37),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id38"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "Location: DODOMA-IYUMBU", snippet: ""),
            position: pinPosition38),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id39"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "Location: MTWARA-Raha Leo", snippet: ""),
            position: pinPosition39),
      );
    });
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId("marker_id40"),
            icon: pinPositionIcon,
            infoWindow: InfoWindow(title: "Location: CHATO", snippet: ""),
            position: pinPosition40),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WELCOME TO OUR LOCATION'),
        backgroundColor: Colors.red,
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        compassEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _addMarkers();
          var _mapController;
          _mapController.onMarkerTapped.add((marker) {
            // your code here
          });
        },
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: pinPosition,
          zoom: _zoom,
        ),
      ),
    );
  }

  
}
