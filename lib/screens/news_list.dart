import 'package:flutter/material.dart';
import 'package:news_app/components/news_tile.dart';
import 'package:news_app/models/news.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
  String collection;
  NewsList({this.collection});
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    final news = Provider.of<List<News>>(context) ?? [];
    return ListView.builder(itemCount: news.length,
    itemBuilder: (context, index) {
      
      return
       NewsTile(news: news[index], index: index);
    });
  }
}
