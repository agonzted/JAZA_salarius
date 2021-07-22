import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Recent extends StatefulWidget {
  CreateRecent createState() => CreateRecent();
}

class CreateRecent extends State<Recent> {
  Map data;
  // ignore: deprecated_member_use
  List movementsData = new List();
  List movementsDataI = new List();
  List movementsDataG = new List();

  _getMovements() async {
    http.Response response =
    await http.get(Uri.parse('http://localhost:3000/api/movements'));
    data = json.decode(response.body);
    setState(() {
      movementsData = data['movements'];
      for(var x=0;x<movementsData.length;x++){
        if(movementsData[x]['type']=='ingreso'){
          movementsDataI.add(movementsData[x]);
        }else{
          movementsDataG.add(movementsData[x]);
        }
      }
    });
  }

  String _setImage(String type){
    if(type == "ingreso"){
      return 'images/sent.png';
    }else{
      return 'images/recieved.png';
    }
  }
  void _filtroGastos(String type){

  }

  @override
  void initState() {
    super.initState();
    _getMovements();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: HexColor("#262626"),
        appBar: AppBar(
          backgroundColor: HexColor("#21BF48"),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "Todo",),
              Tab(text: "Gastos",),
              Tab(text: "ingresos",),
            ],
          ),
          title: Text('Operaciones'),
        ),
        body: TabBarView(
          children: [
            Center(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: movementsData.length,
                itemBuilder: (BuildContext context, int index) {
                  return SingleChildScrollView(
                    child: Padding(padding:
                    const EdgeInsets.only(left: 15.0, right: 15, top: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: new BorderRadius.only(
                            bottomLeft: const Radius.circular(5.0),
                            bottomRight: const Radius.circular(5.0),
                            topLeft: const Radius.circular(5.0),
                            topRight: const Radius.circular(5.0),
                          ),
                        ),
                        child: ListTile(
                          leading: Container(
                            height: 40,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: new BorderRadius.only(
                                bottomLeft: const Radius.circular(5.0),
                                bottomRight: const Radius.circular(5.0),
                                topLeft: const Radius.circular(5.0),
                                topRight: const Radius.circular(5.0),
                              ),
                              image: DecorationImage(
                                image: AssetImage(_setImage("${movementsData[index]['type']}") ),
                              ),
                            ),
                          ),
                          title: Row(
                            children: [
                              Text(
                                "${movementsData[index]['type']}",
                                style: GoogleFonts.cinzel(
                                    color: Colors.grey,
                                    letterSpacing: 0,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          subtitle: Text(
                              "${movementsData[index]['concept']}",
                              style: TextStyle(
                                color: Colors.grey,
                              )),
                          trailing: Text(
                            "${movementsData[index]['mount']}",
                            style: GoogleFonts.cinzel(
                                color: Colors.grey,
                                letterSpacing: 0,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          isThreeLine: false,
                        ),
                      ),
                    ),
                  );
                }),),
            Center(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: movementsDataG.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SingleChildScrollView(
                      child: Padding(padding:
                      const EdgeInsets.only(left: 15.0, right: 15, top: 25),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: new BorderRadius.only(
                              bottomLeft: const Radius.circular(5.0),
                              bottomRight: const Radius.circular(5.0),
                              topLeft: const Radius.circular(5.0),
                              topRight: const Radius.circular(5.0),
                            ),
                          ),
                          child: ListTile(
                            leading: Container(
                              height: 40,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.only(
                                  bottomLeft: const Radius.circular(5.0),
                                  bottomRight: const Radius.circular(5.0),
                                  topLeft: const Radius.circular(5.0),
                                  topRight: const Radius.circular(5.0),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(_setImage("${movementsDataG[index]['type']}") ),
                                ),
                              ),
                            ),
                            title: Row(
                              children: [
                                Text(
                                  "${movementsDataG[index]['type']}",
                                  style: GoogleFonts.cinzel(
                                      color: Colors.grey,
                                      letterSpacing: 0,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            subtitle: Text(
                                "${movementsDataG[index]['concept']}",
                                style: TextStyle(
                                  color: Colors.grey,
                                )),
                            trailing: Text(
                              "${movementsDataG[index]['mount']}",
                              style: GoogleFonts.cinzel(
                                  color: Colors.grey,
                                  letterSpacing: 0,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            isThreeLine: false,
                          ),
                        ),
                      ),
                    );
                  }),),
            Center(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: movementsDataI.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SingleChildScrollView(
                      child: Padding(padding:
                      const EdgeInsets.only(left: 15.0, right: 15, top: 25),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: new BorderRadius.only(
                              bottomLeft: const Radius.circular(5.0),
                              bottomRight: const Radius.circular(5.0),
                              topLeft: const Radius.circular(5.0),
                              topRight: const Radius.circular(5.0),
                            ),
                          ),
                          child: ListTile(
                            leading: Container(
                              height: 40,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.only(
                                  bottomLeft: const Radius.circular(5.0),
                                  bottomRight: const Radius.circular(5.0),
                                  topLeft: const Radius.circular(5.0),
                                  topRight: const Radius.circular(5.0),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(_setImage("${movementsDataI[index]['type']}") ),
                                ),
                              ),
                            ),
                            title: Row(
                              children: [
                                Text(
                                  "${movementsDataI[index]['type']}",
                                  style: GoogleFonts.cinzel(
                                      color: Colors.grey,
                                      letterSpacing: 0,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            subtitle: Text(
                                "${movementsDataI[index]['concept']}",
                                style: TextStyle(
                                  color: Colors.grey,
                                )),
                            trailing: Text(
                              "${movementsDataI[index]['mount']}",
                              style: GoogleFonts.cinzel(
                                  color: Colors.grey,
                                  letterSpacing: 0,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            isThreeLine: false,
                          ),
                        ),
                      ),
                    );
                  }),),
          ],
        ),
      ),
    );
  }
}
