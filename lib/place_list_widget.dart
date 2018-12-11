import 'package:flutter/material.dart';
import 'place_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class PlaceList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlaceListState();
  }
}

class _PlaceListState extends State<PlaceList> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  Stream<QuerySnapshot> placesStream;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future<dynamic> _refresh() {
    placesStream = Firestore.instance.collection('places').snapshots();
    setState(() {});
    var completer = Completer();
    placesStream.listen((onData) {
      completer.complete();
    });
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: placesStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        ListView lv = ListView.builder(
            itemBuilder: (context, position) {
              return PlaceholderPlace();
            },
            itemCount: 5);

        if (snapshot.connectionState == ConnectionState.active) {
          lv = new ListView(
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
            return Place(place: document);
          }).toList());
        }
        return RefreshIndicator(
            key: _refreshIndicatorKey, onRefresh: _refresh, child: lv);
      },
    );
  }
}
