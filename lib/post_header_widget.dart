import 'package:flutter/material.dart';
import 'placeholder_box_widget.dart';

class PostHeader extends StatelessWidget {
  final String title;
  final String avatarUrl;
  final String subtitle;

  PostHeader({this.title, this.avatarUrl, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 12.0),
      child: Row(
        children: [
          new Container(
              width: 40.0,
              height: 40.0,
              margin: EdgeInsets.only(right: 16.0),
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(
                          this.avatarUrl)))),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    this.title,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                ),
                Text(
                  this.subtitle,
                  style: TextStyle(
                    fontSize: 14
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.share
          )
        ],
      ),
    );
  }
}

class PlaceholderPostHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 12.0),
      child: Row(
        children: [
          new Container(
              width: 40.0,
              height: 40.0,
              margin: EdgeInsets.only(right: 16.0),
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200])
              ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  width: 200.0,
                  height: 20.0,
                  child: PlaceholderBox(),
                ),
                Container(
                  width: 80.0,
                  height: 14.0,
                  child: PlaceholderBox(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
