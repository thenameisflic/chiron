import 'package:flutter/material.dart';
import 'place_header_widget.dart';
import 'place_footer_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Place extends StatefulWidget {
  final DocumentSnapshot place;

  Place({this.place});
  @override
  State<StatefulWidget> createState() {
    return _PlaceState(place: place);
  }
}

class _PlaceState extends State<Place> {
  final DocumentSnapshot place;

  _PlaceState({this.place});
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        PlaceHeader(
          name: this.place.data['name'],
          streetAddress: this.place.data['streetAddress'],
          imageUrl: this.place.data['imageUrl'],
          neighborhood: this.place.data['neighborhood'],
          city: this.place.data['city'],
          state: this.place.data['state'],
        ),
        PlaceFooter()
      ],
    ));
  }
}

class PlaceholderPlace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
            children: [PlaceholderPlaceHeader(), PlaceholderPlaceFooter()]));
  }
}
