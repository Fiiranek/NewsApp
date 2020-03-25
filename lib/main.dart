import 'package:flutter/material.dart';
import 'package:news_app/screens/wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

MaterialColor colorCustom = MaterialColor(0xFF1565C0, {
50:Color.fromRGBO(21,101,192, .1),
100:Color.fromRGBO(21,101,192, .2),
200:Color.fromRGBO(21,101,192, .3),
300:Color.fromRGBO(21,101,192, .4),
400:Color.fromRGBO(21,101,192, .5),
500:Color.fromRGBO(21,101,192, .6),
600:Color.fromRGBO(21,101,192, .7),
700:Color.fromRGBO(21,101,192, .8),
800:Color.fromRGBO(21,101,192, .9),
900:Color.fromRGBO(21,101,192, 1),
});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch:colorCustom,
        primaryColor: Colors.blue[600],
        primaryIconTheme: IconThemeData(color: Colors.blue[800]),
        fontFamily: 'Montserrat'
      ),
      home: Wrapper(),
      
    );
  }
}