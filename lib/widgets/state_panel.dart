import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homepricepredictor/pages/formpage.dart';

// ignore: camel_case_types
class state_panel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1.6),
        children: <Widget>[
          // Panel(statename : 'Delhi', imagepath: "Assets/Images/delhi.jpg",),
           Panel(statename : 'Dar', imagepath: "Assets/Images/Bangalore.jpg",),
        ],
      ),
    );
  }
}

class Panel extends StatelessWidget {

  final String statename;
  final String imagepath;

  const Panel({Key key, this.statename ,this.imagepath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Formpage(Formimagepath: imagepath,formStateName: statename,)));
        },
        child: Container(
          width: width/2,
          decoration : BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [BoxShadow(color:Color.fromRGBO(204, 132, 67, .5) ,blurRadius: 10,
              )]),
          child: Column(
            children: <Widget>[
              ClipRRect(
                   borderRadius: BorderRadius.circular(10.0),
                  child:Image.asset(imagepath,fit: BoxFit.contain,)
              ),
              RichText(text: TextSpan(
                  text : statename,
                  style: GoogleFonts.bellota(textStyle: TextStyle(color: Colors.black54) ,fontSize: 16 ,fontWeight: FontWeight.w800)
              )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
