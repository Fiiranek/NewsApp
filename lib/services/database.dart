import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/models/news.dart';

class DatabaseService{
  String collection;
  DatabaseService({this.collection});
  static CollectionReference sportCollection = Firestore.instance.collection('sport');

  List<News> _newsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return News(
        date: doc.data['date'] ?? 0,
        title: doc.data['title'] ?? ' ',
        author: doc.data['author'] ?? '',
        content: doc.data['content'] ?? '',
        id: doc.documentID ?? '',
        imageUrl: doc.data['imageUrl'] ?? '',
        tag: doc.data['tag'] ?? ''
      );
    }).toList();
  }

  Stream<List<News>> get sportNews  {
    // return DatabaseService.sportCollection.orderBy('date', descending:true).snapshots()
    //     .map(_newsListFromSnapshot);
      return Firestore.instance.collection(collection).orderBy('date', descending:true).snapshots()
        .map(_newsListFromSnapshot);
    }

}