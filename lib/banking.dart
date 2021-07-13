import 'dart:convert';
import 'package:finance/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;



final typeController = TextEditingController();
final conceptController = TextEditingController();
final mountController = TextEditingController();


class Banking extends StatelessWidget {

   _postMovements() async {
    Map data = {
      'type': typeController.text,
      'concept': conceptController.text,
      'mount': mountController.text,
    };

    var body = json.encode(data);

    var response = await http.post(
        Uri.parse('http://10.0.2.2:3000/api/movements'),
        headers: {"Content-Type": "application/json"},
        body: body);
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Icon(Icons.arrow_back_ios,
                          color: Colors.grey[600], size: 20),
                    )),
              ],
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    'Agregar Gasto/Ingreso',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),
              child: TextFormField(
                controller: typeController,
                style: TextStyle(fontSize: 18.0),
                decoration: InputDecoration(
                  labelText: 'Tipo',
                  labelStyle: TextStyle(fontSize: 18.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),
              child: TextFormField(
                controller: conceptController,
                style: TextStyle(fontSize: 18.0),
                decoration: InputDecoration(
                    labelText: 'Concepto',
                    labelStyle: TextStyle(fontSize: 18.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),
              child: TextFormField(
                controller: mountController,
                style: TextStyle(fontSize: 18.0),
                decoration: InputDecoration(
                    labelText: 'Monto',
                    labelStyle: TextStyle(fontSize: 18.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                ),
              ),
            ),
            Container(
                decoration: new BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    //background color of box
                    BoxShadow(
                      color: Colors.blue[400],
                      blurRadius: 10.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                      offset: Offset(
                        0.0, // Move to right 10  horizontally
                        3.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: IconButton(
                      onPressed: () async{
                        await _postMovements();
                        var route = new MaterialPageRoute(
                          builder: (BuildContext context) => new Profile(),
                        );

                        Navigator.of(context).push(route);
                      },
                      iconSize: 30.0,
                      icon: Icon(
                        Icons.forward_outlined,
                      ),
                      color: Colors.white,
                    ))),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

}