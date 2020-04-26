import 'package:flutter/material.dart';
import 'package:assignmentuserlist/Pages/userinfo.dart';
import 'package:assignmentuserlist/Pages/userlist.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => userlist(),
    '/userinfo': (context) => userinfo(),
  },
));
