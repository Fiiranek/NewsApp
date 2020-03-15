import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/components/app_bar_news.dart';
import 'package:news_app/models/news.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetail extends StatelessWidget {
  static TextStyle redBorder = TextStyle(color: Colors.red[300]);
  Text border = Text('   |   ', style: redBorder,);
  News news;
  String date;
  String hour;
  NewsDetail({this.news, this.date, this.hour});
  TextStyle titleStyle =
      TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500);

  _launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

  @override
  Widget build(BuildContext context) {

    Wrap topInfo = news.tag.isEmpty ? Wrap(children: <Widget>[Text(news.author),border,Text(date),border,Text(hour)],) : Wrap(children: <Widget>[Text(news.author),border,Text(date),border,Text(hour),border,Text(news.tag)],);

    return Scaffold(
      appBar: appBarNews,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal:15, vertical:10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    news.title,
                    style: titleStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  topInfo,
                  SizedBox(
                    height: 20,
                  ),
                  Image.network(
                    news.imageUrl,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    news.content.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.blue[600]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(FontAwesomeIcons.facebookF, color: Colors.white,),onPressed: (){
                      _launchURL('https://www.facebook.com/lovekrakow/');
                    },
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.instagram,color: Colors.white,),onPressed: (){
                      launch('https://www.instagram.com/lovekrakow.pl/?hl=pl');
                    },
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.twitter,color: Colors.white,),onPressed: (){
                      launch('https://twitter.com/lovekrakow');
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
