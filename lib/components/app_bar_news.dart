import 'package:flutter/material.dart';

AppBar appBarNews = AppBar(
  elevation: 1,
  centerTitle: true,
  title: Image(
    image: AssetImage('assets/guardian.jpg'),
    // image: AssetImage('assets/appLogo.png'),
    width: 130,
  ),
  backgroundColor: Colors.white,
  bottom: PreferredSize(
    preferredSize: Size.fromHeight(2),
    child: Container(
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.blue[600], width: 2))),
    ),
  ),
);
