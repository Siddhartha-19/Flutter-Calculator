
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String output="";
  int firstnumber;
  int secondnumber;
  String poperator;
  String inter;
  calc(String dvar)
  {
    if(dvar=='C')
    {
      output="";
      firstnumber=0;
      secondnumber=0;
      inter="";
    }
    else if(dvar=='+'||dvar=='-'||dvar=='X'||dvar=='/')
    {
      firstnumber=int.parse(output);
      poperator=dvar;
      inter="";
    }
    else if(dvar=="=")
    {
      secondnumber=int.parse(output);
      if(poperator=="+")
      {
        inter=(firstnumber+secondnumber).toString();
      }
      if(poperator=="-")
      {
        inter=(firstnumber-secondnumber).toString();
      }
      if(poperator=="X")
      {
        inter=(firstnumber*secondnumber).toString();
      }
      if(poperator=="/")
      {
        inter=(firstnumber/secondnumber).toString();
      }
    }
    else 
    {
       inter=int.parse(output+dvar).toString();
    }
     setState(() {
       output=inter;
     });
    
  }

  Widget custombutton(String dvar){
    return Expanded(
      child: Padding(
        padding:EdgeInsets.all(8), 
      
     child: MaterialButton(
              onPressed:() => calc(dvar),
             child: Text('$dvar',
             style: TextStyle(
              fontSize: 35,
             ),),
           shape: CircleBorder(),
           splashColor: Colors.cyan[200],
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title:Text('Calculator'),
          backgroundColor: Colors.orangeAccent,
        ),
      body: Container(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child:Container(
                alignment:Alignment.bottomRight,
                 child: Text('$output',
                 style:TextStyle(
                   fontSize:40,
                 ) ,
                 ),
                 

              ) ,
            ),
             Row(
              children: <Widget>[
             custombutton('7'),
            custombutton('8'),
            custombutton('9'),
            custombutton('+'),
              ]
            ),
             Row(
              children: <Widget>[
            custombutton('4'),
            custombutton('5'),
            custombutton('6'),
            custombutton('-'),
              ]
            ),
             Row(
              children: <Widget>[
           
            custombutton('1'),
            custombutton('2'),
            custombutton('3'),
            custombutton('X'),
              ]
            ),
            Row(
              children: <Widget>[
            custombutton('C'),
            custombutton('0'),
            custombutton('='),
            custombutton('/'),
              ]
            ),
          ],

        )
      ),
      ),
      
    );
  }
}