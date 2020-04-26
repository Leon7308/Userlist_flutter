import 'package:flutter/material.dart';
import 'dart:math' as math;

class userinfo extends StatefulWidget {
  @override
  _userinfoState createState() => _userinfoState();
}

class _userinfoState extends State<userinfo> {
  @override
  Map data = {};
  bool dark = false;


  Widget build(BuildContext context) {
    double screenHeight = MediaQuery. of(context). size. height;
    double screenWidth = MediaQuery. of(context). size. width;
    Color color1 = !dark? Colors.white : Colors.grey[700];
    Color color2 = !dark? Colors.lightBlueAccent : Colors.black;
    Color fontcolor1 = !dark? Colors.black : Colors.white;
    Color fontcolor2 = !dark? Colors.black : Colors.grey[500];


    data =  ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: color1,
            appBar:  PreferredSize(
              preferredSize: Size.fromHeight(screenHeight*0.1),
              child: AppBar(
                iconTheme: IconThemeData(
                  color: fontcolor1, //change your color here
                ),

                flexibleSpace: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,15,0),
                      child: Column(

                        children: <Widget>[
                          SizedBox(height: 25),
                          Switch(
                            value: dark,
                            onChanged: (value) {
                              setState(() {
                                dark = value;
                              });
                            },
                            activeTrackColor: Colors.yellow[700],
                            activeColor: Colors.yellow,
                          ),
                          Container(
                            child: Text("Dark Mode",
                            style: TextStyle(
                              color: fontcolor1,
                            ),
                            )
                          )
                        ],

                      ),
                    ),
                  ],
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 15),
                  child: CircleAvatar(
                    radius: screenHeight*0.05,
                    backgroundImage: AssetImage('assets/avatar.jpg')
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                  child: Text(data['name'],
                  style: TextStyle(
                    color: fontcolor1,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 15, 30, 50),
                  child: Text(data['phone'],
                    style: TextStyle(
                      color: fontcolor1,
                      fontSize: 20,
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: color2,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),

                      )

                    ),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: <Widget>[
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.fromLTRB(15.0,10,15,10),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0,10,20,10),
                                  child: Icon(Icons.calendar_today,
                                  color: fontcolor2),
                                ),
                                Text(
                                  "Member since \n2nd Jan '19",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: fontcolor2
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.fromLTRB(15.0,10,15,10),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0,10,20,10),
                                  child: Icon(Icons.star,
                                      color: fontcolor2),
                                ),
                                Text(
                                    "Achievements",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: fontcolor2
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        ListTile(
                            title: SizedBox(
                              height: screenHeight*0.3,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, __) => _buildBox(color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0)),
                              ),
                            ),
                        )

                      ],
                    ),
                  ),
                )
              ],
            )
          ),
        ],
      ),
    );
  }
  Widget _buildBox({Color color}) =>
      Container(
      margin: EdgeInsets.all(12),
      height:  MediaQuery. of(context). size. height *.25,
      width:  MediaQuery. of(context). size. width *.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: color,

      ),
  );
}

