import 'package:flutter/material.dart';
import 'post_header_widget.dart';
import 'post_body_widget.dart';
import 'post_footer_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Post extends StatefulWidget {
  final DocumentSnapshot document;

  Post({this.document});

  @override
  State<StatefulWidget> createState() {
    return _PostState(document: document);
  }
}

class _PostState extends State<Post> {
  final DocumentSnapshot document;
  DocumentSnapshot _author;
  List<DocumentSnapshot> _likes;

  _PostState({this.document});

  @override
  void initState() {
    super.initState();
    loadAuthor();
    loadLikes();
  }

  void loadAuthor() async {
    var author =
        await (this.document.data['authorRef'] as DocumentReference).get();
    if (this.mounted)
      setState(() => _author = author);
  }

  void loadLikes() async {
    Firestore.instance
        .collection('likes')
        .where("postRef", isEqualTo: document.reference)
        .snapshots()
        .listen((data) {
      if (this.mounted)
        setState(() => _likes = data.documents);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: [
      _author != null
          ? PostHeader(
              title: _author.data['nickname'],
              subtitle: document.data['subtitle'],
              avatarUrl: _author.data['avatarUrl'],
            )
          : PlaceholderPostHeader(),
      PostBody(content: document.data['content']),
      _likes != null ? PostFooter(text: "${_likes.length} pessoa${_likes.length > 1 ? "s" : ""} curti${_likes.length > 1 ? "ram" : "u"} isso") : PlaceholderPostFooter()
    ]));
  }
}

class PlaceholderPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        child:
            Column(children: [PlaceholderPostHeader(), PlaceholderPostBody()]));
  }
}
