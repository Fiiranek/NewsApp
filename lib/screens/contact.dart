import 'package:flutter/material.dart';
import 'package:news_app/components/app_bar_news.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  _launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
  List<String> titles = ['Email','Reklama','Patryk Salamon – Redaktor naczelny','Jakub Drath – Dział Dzielnice','Patronat medialny'];
  List<String> subtitles = ['redakcja@lovekrakow.pl','reklama@lovekrakow.pl','p.salamon@lovekrakow.pl','j.drath@lovekrakow.pl','Kliknij tutaj!'];
  List actions = [
    'mailto:redakcja@lovekrakow.pl',
    'mailto:reklama@lovekrakow.pl',
    'mailto:p.salamon@lovekrakow.pl',
    'mailto:p.j.drath@lovekrakow.pl',
    'https://lovekrakow.pl/strona/patronat.html'
  ];
  TextStyle titleStyle = TextStyle(fontSize: 20);
  TextStyle subtitleStyle = TextStyle(fontSize: 16, color: Colors.blue[600]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarNews,
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(itemCount: titles.length,
    itemBuilder: (context, index) {
      
      return ListTile(
        onTap: (){
          _launchURL(actions[index]);
        },
        title: Text(titles[index], style: titleStyle,),
        subtitle: Text(subtitles[index], style: subtitleStyle,),
      );
       
    })
      ),
    );
  }
}