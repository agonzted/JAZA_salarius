import 'dart:convert';
import 'package:finance/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

final typeController = TextEditingController();
final conceptController = TextEditingController();
final mountController = TextEditingController();

class Banking extends StatelessWidget {
final String userData;

const Banking({this.userData});


Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
      var bodyAux = json.decode(barcodeScanRes);

      Map data = {
        'type': bodyAux['type'],
        'concept': bodyAux['concept'],
        'mount': bodyAux['mount'],
        'user': userData
      };

      var body = json.encode(data);

      var response = await http.post(
          Uri.parse('https://api-salaries.herokuapp.com/api/movements'),
          headers: {"Content-Type": "application/json"},
          body: body);

    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }

  _postMovements() async {
    Map data = {
      'type': typeController.text,
      'concept': conceptController.text,
      'mount': mountController.text,
      'user': userData
    };

    var body = json.encode(data);

    var response = await http.post(
        Uri.parse('https://api-salaries.herokuapp.com/api/movements'),
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
                      Navigator.pop(context);
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
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              child: Material(
                elevation: 20.0,
                borderRadius: BorderRadius.circular(40),
                color: HexColor("0D0D0D"),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: typeController,
                  textAlign: TextAlign.center,
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
                          borderSide: BorderSide(
                              color: HexColor("#595959"), width: 3.0))),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              child: Material(
                elevation: 20.0,
                borderRadius: BorderRadius.circular(40),
                color: HexColor("0D0D0D"),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: conceptController,
                  textAlign: TextAlign.center,
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
                          borderSide: BorderSide(
                              color: HexColor("#595959"), width: 3.0))),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              child: Material(
                elevation: 20.0,
                borderRadius: BorderRadius.circular(40),
                color: HexColor("0D0D0D"),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: mountController,
                  textAlign: TextAlign.center,
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
                          borderSide: BorderSide(
                              color: HexColor("#595959"), width: 3.0))),
                ),
              ),
            ),
            Container(
              decoration: new BoxDecoration(
                color: HexColor("24BF48"),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: IconButton(
                      onPressed: () async {
                        await _postMovements();
                        Navigator.pop(context);
                      },
                      iconSize: 30.0,
                      icon: Icon(
                        Icons.forward,
                      ),
                      color: HexColor("#ffffff"),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: IconButton(
                      onPressed: () async {
                        await scanQR();
                        Navigator.pop(context);
                      },
                      iconSize: 30.0,
                      icon: Icon(
                        Icons.camera,
                      ),
                      color: HexColor("#ffffff"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
