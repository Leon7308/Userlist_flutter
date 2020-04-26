import 'package:flutter/material.dart';
import 'package:assignmentuserlist/Resources/user.dart';
import 'package:assignmentuserlist/Resources/API.dart';
import 'dart:convert';

class userlist extends StatefulWidget {
  @override
  _userlistState createState() => _userlistState();
}

class _userlistState extends State<userlist> {

  void pushInfo(index) async{

    user instance = users[index];

    Navigator.pushNamed(context, '/userinfo', arguments: {
      'name': instance.name,
      'phone': instance.phone
    });

  }

  var users = new List<user>();

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => user.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }



  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery. of(context). size. height;
    double screenWidth = MediaQuery. of(context). size. width;

    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Text('GitHub Users List'),
        ),
        body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
                child: ListTile(
                  onTap: () {
                    pushInfo(index);
                  },
                  title: Text(users[index].name),
                  leading: CircleAvatar(
                    radius: screenHeight*0.05,
                    backgroundColor: Colors.grey[900],
                  ),
                ),
              );
            }
        )
    );
  }
}
