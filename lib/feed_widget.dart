import 'package:flutter/material.dart';
import 'post_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Feed extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FeedState();
  }
}

class _FeedState extends State<Feed> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('posts').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return ListView.builder(
                  itemBuilder: (context, position) {
                    return PlaceholderPost();
                  },
                  itemCount: 5);
            default:
              return new ListView(
                  children:
                      snapshot.data.documents.map((DocumentSnapshot document) {
                return Post(document: document);
              }).toList());
          }
        });
  }
}
