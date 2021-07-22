import 'package:finance/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  CreateRegister createState() => CreateRegister();
}

final userController = TextEditingController();
final passwordController = TextEditingController();
final confirmPasswordController = TextEditingController();

class CreateRegister extends State<Register> {
  Map data;
  List movementsData = new List();

  _postMovements() async {
    Map data = {
      'user': userController.text,
      'password': passwordController.text,
    };

    var body = json.encode(data);
    if (passwordController.text == confirmPasswordController.text) {
      var response = await http.post(
          Uri.parse('http://10.0.2.2:3000/api/users'),
          headers: {"Content-Type": "application/json"},
          body: body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#262626"),
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
                    'Registrate',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Material(
                elevation: 20.0,
                borderRadius: BorderRadius.circular(40),
                color: HexColor("0D0D0D"),
                child: TextFormField(
                  controller: userController,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                  autofocus: false,
                  decoration: InputDecoration(
                      hintStyle: GoogleFonts.openSans(
                          color: HexColor("A6A6A6"),
                          fontSize: 17,
                          fontWeight: FontWeight.normal),
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 26.0, bottom: 5),
                        child: new Icon(Icons.mail_outline_outlined,
                            color: HexColor("A6A6A6"), size: 22),
                      ),
                      hintText: 'Ingresa tu usuario',
                      fillColor: HexColor("#0D0D0D"),
                      filled: true,
                      contentPadding:
                          EdgeInsets.fromLTRB(-30.0, 30.0, 20.0, 20.0),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          borderSide: BorderSide(
                              color: HexColor("#595959"), width: 3.0))),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Material(
                elevation: 20.0,
                borderRadius: BorderRadius.circular(40),
                color: HexColor("0D0D0D"),
                child: TextFormField(
                  controller: passwordController,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  autofocus: false,
                  decoration: InputDecoration(
                      hintStyle: GoogleFonts.openSans(
                          color: HexColor("A6A6A6"),
                          fontSize: 17,
                          fontWeight: FontWeight.normal),
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 26.0, bottom: 5),
                        child: new Icon(Icons.mail_outline_outlined,
                            color: HexColor("A6A6A6"), size: 22),
                      ),
                      hintText: 'Ingresa tu contraseña',
                      fillColor: HexColor("#0D0D0D"),
                      filled: true,
                      contentPadding:
                          EdgeInsets.fromLTRB(-30.0, 30.0, 20.0, 20.0),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          borderSide: BorderSide(
                              color: HexColor("#595959"), width: 3.0))),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Material(
                elevation: 20.0,
                borderRadius: BorderRadius.circular(40),
                color: HexColor("0D0D0D"),
                child: TextFormField(
                  controller: confirmPasswordController,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  autofocus: false,
                  decoration: InputDecoration(
                      hintStyle: GoogleFonts.openSans(
                          color: HexColor("A6A6A6"),
                          fontSize: 17,
                          fontWeight: FontWeight.normal),
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 26.0, bottom: 5),
                        child: new Icon(Icons.mail_outline_outlined,
                            color: HexColor("A6A6A6"), size: 22),
                      ),
                      hintText: 'Confirma tu contraseña',
                      fillColor: HexColor("#0D0D0D"),
                      filled: true,
                      contentPadding:
                          EdgeInsets.fromLTRB(-30.0, 30.0, 20.0, 20.0),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          borderSide: BorderSide(
                              color: HexColor("#595959"), width: 3.0))),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Container(
                decoration: new BoxDecoration(
                  color: HexColor("24BF48"),
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    //background color of box
                  ],
                ),
                child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: IconButton(
                      onPressed: () {
                        _postMovements();
                        Navigator.pop(context);
                      },
                      iconSize: 30.0,
                      icon: Icon(
                        Icons.forward,
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
