import 'package:finance/banking.dart';
import 'package:finance/recent.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Profile extends StatefulWidget {
  CreateProfile createState() => CreateProfile();
}

class CreateProfile extends State<Profile> {
  Map data;
  List movementsData = new List();

  _getMovements() async {
    http.Response response =
        await http.get(Uri.parse('http://10.0.2.2:3000/api/movements'));
    data = json.decode(response.body);
    setState(() {
      movementsData = data['movements'];
    });
  }

  String _setImage(String type){
    if(type == "ingreso"){
      return 'images/sent.png';
    }else{
      return 'images/recieved.png';
    }
  }

  @override
  void initState() {
    super.initState();
    _getMovements();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                        bottomLeft: const Radius.circular(5.0),
                        bottomRight: const Radius.circular(5.0),
                        topLeft: const Radius.circular(5.0),
                        topRight: const Radius.circular(5.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300],
                          blurRadius: 10.0, // soften the shadow
                          spreadRadius: 2.0, //extend the shadow
                          offset: Offset(
                            0, // Move to right 10  horizontally
                            4, // Move to bottom 10 Vertically
                          ),
                        )
                      ]),
                  height: 290,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
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
                                  color: Colors.grey[600], size: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: ClipOval(
                              child: Material(
                                color: Colors.blue,
                                child: InkWell(
                                  splashColor: Colors.red, // Splash color
                                  onTap: () {
                                    var route = new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            new Banking());
                                    Navigator.of(context).push(route);
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Image.network(
                        'https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png',
                        height: 90,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 70,
                      ),
                      Text(
                        'Anthony González',
                        style: GoogleFonts.cinzel(
                            color: Colors.grey[900],
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        'Desarrollador',
                        style: GoogleFonts.lato(
                            color: Colors.grey[500],
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$485',
                        style: GoogleFonts.cinzel(
                            color: Colors.grey[900],
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 27,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              var route = new MaterialPageRoute(
                                builder: (BuildContext context) => new Recent(),
                              );

                              Navigator.of(context).push(route);
                            },
                            child: Container(
                                decoration: new BoxDecoration(
                                  color: Colors.blue[800],
                                  borderRadius: BorderRadius.circular(40),
                                  boxShadow: [
                                    //background color of box
                                    BoxShadow(
                                      color: Colors.blue[200],
                                      blurRadius: 6.0, // soften the shadow
                                      spreadRadius: 0.0, //extend the shadow
                                      offset: Offset(
                                        0.0, // Move to right 10  horizontally
                                        2.0, // Move to bottom 10 Vertically
                                      ),
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 22, right: 22, top: 5, bottom: 12),
                                  child: Text(
                                    'Transacciones recientes',
                                    style: GoogleFonts.lato(
                                        color: Colors.white,
                                        letterSpacing: 1,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  ))),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 22.0),
                  child: Text(
                    'Vista General',
                    style: GoogleFonts.cinzel(
                        color: Colors.grey[700],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 22.0),
                  child: Text(
                    'jun',
                    style: GoogleFonts.lato(
                        color: Colors.grey[600],
                        fontSize: 13,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: movementsData.length,
                itemBuilder: (BuildContext context, int index) {
                  return SingleChildScrollView(
                    child: Padding(padding:
                        const EdgeInsets.only(left: 15.0, right: 15, top: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.only(
                            bottomLeft: const Radius.circular(5.0),
                            bottomRight: const Radius.circular(5.0),
                            topLeft: const Radius.circular(5.0),
                            topRight: const Radius.circular(5.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[300],
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 2.0, //extend the shadow
                              offset: Offset(
                                0, // Move to right 10  horizontally
                                4, // Move to bottom 10 Vertically
                              ),
                            )
                          ]),
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
                                  color: Colors.black,
                                  letterSpacing: 0,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        subtitle: Text("${movementsData[index]['concept']}"),
                        trailing: Text(
                          "${movementsData[index]['mount']}",
                          style: GoogleFonts.cinzel(
                              color: Colors.black,
                              letterSpacing: 0,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        isThreeLine: false,
                      ),
                    ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
