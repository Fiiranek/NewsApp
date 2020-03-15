import 'package:flutter/material.dart';
import 'package:news_app/components/drawer.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/screens/contact.dart';
import 'package:news_app/screens/news_list.dart';
import 'package:news_app/services/database.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  TextStyle tabText =
    TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w300);
  List menuItems = ['Kontakt','Pomoc'];
  @override
  Widget build(BuildContext context) {

  AppBar appBar = AppBar(
      elevation: 1,
      centerTitle: true,
      title: Image(
        // image: AssetImage('assets/appLogo.png'),
        image: AssetImage('assets/guardian.jpg'),
        width: 130,
      ),
      backgroundColor: Colors.white,
      actions: <Widget>[
        PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem(
                    value: '0',
                    child: 
                    Text('Kontakt', textAlign: TextAlign.center,),
                    
                  ),
                  PopupMenuItem(
                    value: '1',
                    child: Text('Pomoc'),
                  ),
                  PopupMenuItem(
                    value: '2',
                    child: Text('O nas'),
                  )
                ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            onSelected: (val) {
              switch (val) {
                case '0':
                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Contact()));
                  }
              }
            })
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Column(
          children: <Widget>[
            Container(
              height: 2,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.blue[600], width: 2))),
            ),
            TabBar(
              // unselectedLabelColor: Colors.black,
              // indicator: BoxDecoration(
              //   color: Colors.blue[600],
              // ),
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    'Życie miasta',
                    style: tabText,
                  ),
                ),
                Tab(
                  child: Text('Komunikacja', style: tabText),
                ),
                Tab(
                  child: Text('Biznes', style: tabText),
                ),
                Tab(
                  child: Text('Sport', style: tabText),
                ),
                Tab(
                  child: Text(
                    'Kultura',
                    style: tabText,
                  ),
                ),
                Tab(
                  child: Text(
                    'Dzielnice',
                    style: tabText,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );  

    return
        DefaultTabController(
            length: 6,
            child: Scaffold(
              drawer: appDrawer,
              appBar: appBar,
              body: Container(
                child: TabBarView(
                  children: <Widget>[
                    StreamProvider<List<News>>.value(
                      value:
                          DatabaseService(collection: 'zycieMiasta').sportNews,
                      child: NewsList(),
                    ),
                    StreamProvider<List<News>>.value(
                      value:
                          DatabaseService(collection: 'komunikacja').sportNews,
                      child: NewsList(),
                    ),
                    StreamProvider<List<News>>.value(
                      value: DatabaseService(collection: 'biznes').sportNews,
                      child: NewsList(),
                    ),
                    StreamProvider<List<News>>.value(
                      value: DatabaseService(collection: 'sport').sportNews,
                      child: NewsList(),
                    ),
                    StreamProvider<List<News>>.value(
                      value: DatabaseService(collection: 'kultura').sportNews,
                      child: NewsList(),
                    ),
                    StreamProvider<List<News>>.value(
                      value: DatabaseService(collection: 'dzielnice').sportNews,
                      child: NewsList(),
                    ),
                  ],
                ),
              ),
            )
            );
  }
}
