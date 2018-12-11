import 'package:flutter/material.dart';
import 'placeholder_box_widget.dart';

class PostFooter extends StatefulWidget {
  final String text;

  PostFooter({this.text});

  @override
  State<StatefulWidget> createState() {
    return _PostFooter(text: this.text);
  }
}

class _PostFooter extends State<PostFooter> {
  final String text;
  _PostFooter({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      child: Row(
        children: [
          Expanded(child: Text(this.text, style: TextStyle(color: Colors.grey[500]),)),
          Icon(Icons.reply),
          Padding(
              padding: EdgeInsets.only(left: 16.0), child: Icon(Icons.favorite)),
        ],
      )
    );
  }
}

class PlaceholderPostFooter extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return Container(
      padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      child: Row(
        children: [
          Container(height: 16, width: 150, child: PlaceholderBox())
        ],
      )
    );
    }
}