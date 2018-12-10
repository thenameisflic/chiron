import 'package:flutter/material.dart';

class PostFooter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PostFooter();
  }
}

class _PostFooter extends State<PostFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      child: Row(
        children: [
          Expanded(child: Text("10 pessoas curtiram isso", style: TextStyle(color: Colors.grey[500]),)),
          Icon(Icons.reply),
          Padding(
              padding: EdgeInsets.only(left: 16.0), child: Icon(Icons.favorite)),
        ],
      )
    );
  }
}
