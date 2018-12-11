import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'post_widget.dart';

class Feed extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FeedState();
  }
}

class _FeedState extends State<Feed> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  Stream<QuerySnapshot> postsStream;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future<dynamic> _refresh() {
    postsStream = Firestore.instance.collection('posts').snapshots();
    setState(() {});
    var completer = Completer();
    postsStream.listen((onData) {
      completer.complete();
    });
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: postsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          var lv = ListView.builder(
              itemBuilder: (context, position) {
                return PlaceholderPost();
              },
              itemCount: 5);
          if (snapshot.connectionState == ConnectionState.active) {
            lv = new ListView(
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
              return Post(document: document);
            }).toList());
          }
          return RefreshIndicator(
            key: _refreshIndicatorKey, onRefresh: _refresh, child: lv);;
        });
  }
}
