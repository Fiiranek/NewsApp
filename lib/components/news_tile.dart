import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/screens/news_detail.dart';

class NewsTile extends StatefulWidget {
  final News news;
  var index;
  NewsTile({this.news, this.index});

  @override
  _NewsTileState createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  final f = DateFormat('yyyy-MM-dd');
  final hourFormat = DateFormat('Hm');
  String timeToDisplay;
  String dateToDisplay;
  String hourToDisplay;
  TextStyle titleStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  @override
  Widget build(BuildContext context) {
    String titleToDisplay = widget.news.title;
    if (widget.news.title.length > 60) {
      titleToDisplay = widget.news.title.substring(0, 60) + '...';
    }

    int now = DateTime.now().millisecondsSinceEpoch;
    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(widget.news.date + 3600000);
    if ((now - widget.news.date) < 86400000) {
      //display hour instead of normal date if news is generated before 24 hours
      timeToDisplay = hourFormat.format(date);
    }
    // display normal date
    else {
      timeToDisplay = f.format(date);
    }

    hourToDisplay = hourFormat.format(date);
    dateToDisplay = f.format(date);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetail(
              news: widget.news,
              date: dateToDisplay,
              hour: hourToDisplay,
            ),
          ),
        );
      },
      child: 
      // Card(
      //   margin: EdgeInsets.all(10),
      //   elevation: 1,
      //   child:Row(
      //       children: <Widget>[
      //         Flexible(
      //             flex: 1,
      //             child: Image.network(
      //               widget.news.imageUrl,
      //             )),
      //         Flexible(
      //           fit: FlexFit.loose,
      //           flex: 1,
      //           child: Padding(
      //             padding: EdgeInsets.all(8),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.end,
      //               children: <Widget>[
      //                 Text(
      //                   titleToDisplay,
      //                   style: titleStyle,
      //                 ),
      //                 Align(
      //                   alignment: Alignment.bottomCenter,
      //                   child: Row(
      //                     children: <Widget>[
      //                       Text(timeToDisplay),
      //                       Text(
      //                         widget.news.tag,
      //                         style: TextStyle(color: Colors.red[300]),
      //                       )
      //                     ],
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         )
      //       ],

      //   ),
      // )

      Card(

          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(10),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
      borderRadius: BorderRadius.only(topLeft:Radius.circular(8),topRight:Radius.circular(8)),
      child: Image.network(widget.news.imageUrl,)),
      SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                        titleToDisplay,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: <Widget>[
                        Text(timeToDisplay),
                        SizedBox(width: 10,),
                        Text(
                            widget.news.tag,
                            style: TextStyle(color: Colors.red[300]),)
                      ],)
                  ],
                ),
              ),
            ],
          )
          ),
    );
  }
}
