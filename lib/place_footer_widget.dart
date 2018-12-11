import 'package:flutter/material.dart';
import 'placeholder_box_widget.dart';

class PlaceFooter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlaceFooterState();
  }
}

class _PlaceFooterState extends State<PlaceFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
        child: Row(
          children: [
            Expanded(
                child: Text(
              "10 seguidores / 11 postagens",
              style: TextStyle(color: Colors.grey[500]),
            )),
            Icon(Icons.reply),
            Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Icon(Icons.favorite)),
          ],
        ));
  }
}

class PlaceholderPlaceFooter extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return Container(
      padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      child: Row(
        children: [
          Container(height: 16, width: 180, child: PlaceholderBox())
        ],
      )
    );
    }
}