import 'package:flutter/material.dart';
import 'enums.dart';

class PostBody extends StatelessWidget {
  final String mediaUrl;
  final MediaType mediaType;
  final String content;

  PostBody({this.mediaUrl, this.mediaType, this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 12.0),
      child: Column(
        children: [
          this.mediaUrl != null ? Image.network(this.mediaUrl) : Container(),
          Container(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              this.content,
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
