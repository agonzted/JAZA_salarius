import 'dart:convert';
import 'package:finance/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
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
        Uri.parse('http://localhost:3000/api/movements'),
        headers: {"Content-Type": "application/json"},
        body: body);
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: HexColor("262626"),
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
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),
              child: Material(
                elevation: 20.0,
                borderRadius: BorderRadius.circular(40),
                color: HexColor("0D0D0D"),
                child: TextFormField(
                  controller: typeController,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  autofocus: false,
                  decoration: InputDecoration(
                      hintStyle: GoogleFonts.openSans(
                          color: HexColor("A6A6A6"),
                          fontSize: 17,
                          fontWeight: FontWeight.normal),
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 26.0, bottom: 5),
                        child: new Icon(Icons.drag_handle,
                            color: HexColor("A6A6A6"), size: 22),
                      ),
                      hintText: 'Ingresa el tipo de movimiento',
                      fillColor: HexColor("#0D0D0D"),
                      filled: true,
                      contentPadding:
                      EdgeInsets.fromLTRB(-30.0, 30.0, 20.0, 20.0),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          borderSide:
                          BorderSide(color: HexColor("#595959"), width: 3.0))),
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),
              child: Material(
                elevation: 20.0,
                borderRadius: BorderRadius.circular(40),
                color: HexColor("0D0D0D"),
                child: TextFormField(
                  controller: conceptController,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  autofocus: false,
                  decoration: InputDecoration(
                      hintStyle: GoogleFonts.openSans(
                          color: HexColor("A6A6A6"),
                          fontSize: 17,
                          fontWeight: FontWeight.normal),
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 26.0, bottom: 5),
                        child: new Icon(Icons.question_answer,
                            color: HexColor("A6A6A6"), size: 22),
                      ),
                      hintText: 'Ingresa el concepto del movimiento',
                      fillColor: HexColor("#0D0D0D"),
                      filled: true,
                      contentPadding:
                      EdgeInsets.fromLTRB(-30.0, 30.0, 20.0, 20.0),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          borderSide:
                          BorderSide(color: HexColor("#595959"), width: 3.0))),
                ),
              ),

            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),
              child: Material(
                elevation: 20.0,
                borderRadius: BorderRadius.circular(40),
                color: HexColor("0D0D0D"),
                child: TextFormField(
                  controller: mountController,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  autofocus: false,
                  decoration: InputDecoration(
                      hintStyle: GoogleFonts.openSans(
                          color: HexColor("A6A6A6"),
                          fontSize: 17,
                          fontWeight: FontWeight.normal),
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 26.0, bottom: 5),
                        child: new Icon(Icons.attach_money,
                            color: HexColor("A6A6A6"), size: 22),
                      ),
                      hintText: 'Ingresa el monto',
                      fillColor: HexColor("#0D0D0D"),
                      filled: true,
                      contentPadding:
                      EdgeInsets.fromLTRB(-30.0, 30.0, 20.0, 20.0),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          borderSide:
                          BorderSide(color: HexColor("#595959"), width: 3.0))),
                ),
              ),
            ),
            Container(
                decoration: new BoxDecoration(
                  color: HexColor("24BF48"),
                  borderRadius: BorderRadius.circular(40),
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
                        Icons.forward,
                      ),
                      color: HexColor("#ffffff"),
                    ))),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

}