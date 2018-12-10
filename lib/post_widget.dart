import 'package:flutter/material.dart';
import 'post_header_widget.dart';
import 'post_body_widget.dart';
import 'post_footer_widget.dart';
import 'enums.dart';

class Post extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PostState();
  }
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: [
      PostHeader(
        title: "Carl Johnson",
        subtitle: "Euro Business",
        avatarUrl: "https://i.imgur.com/BoN9kdC.png",
      ),
      PostBody(
          content:
              'Eu amo esse lugar, mas tenho algumas críticas a fazer. Os elevadores sempre quebram!',
          mediaType: MediaType.IMAGE),
      PostFooter()
    ]));
  }
}
