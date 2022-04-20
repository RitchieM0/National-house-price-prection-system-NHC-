import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:homepricepredictor/homepage.dart';

// import 'widgets/menuWidget.dart';

// import 'package:homepricepredictor/widgets/form.dart';

void main()
{ 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
      home: Scaffold(
        drawer: Drawer(
      
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),

          ),
      
          Image.asset('assets/nhc2.png', fit: BoxFit.cover),
          // Container(
          //        child: Padding(
          //   padding: EdgeInsets.all(40),
          //   child: Text('More details', style: TextStyle(fontWeight:FontWeight.bold, fontSize: 23),  ),
       
          // ),
        
            
          //  ), 
           Container(child: Column(
children: [ 
  // Text('For more inquiries consider the contacts below'),
  ListTile( leading: Icon(Icons.phone_android), title: Text("PHONE: 0621235166"),        
            
          ),
          ListTile( leading: Icon(Icons.person ), title: Text('person information'),


          ),
          ListTile(leading: Icon(Icons.mark_email_read_rounded), title: Text('EMAIL: nhcpriceprediction@gmail.com'),
          
          ),
          ListTile( leading: Icon(Icons.maps_home_work_sharp), title: Text('14113 kijitonyama Dar es salaam Tanzania'),
          
          ),
           ListTile( leading: Icon(Icons.add_comment_rounded ), title: Text('About-us'),
          
          ),
          ListTile( leading: Icon(Icons.logout ), title: Text('Logout'
          ),
          
          ),
          ],

           ),
            
           ),
           ],
      ),
       

       
      ),
        
        //  drawer: MenuWidget(),
      appBar: AppBar(
          title: new Text('NATIONAL HOUSE'),
        ),
        body:  HomePage(),
        ),
      
    );
  }
}
