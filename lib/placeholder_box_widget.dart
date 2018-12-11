import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class _AnimatedBox extends AnimatedWidget {
  _AnimatedBox({Key key, Animation<Color> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<Color> animation = listenable;
    return Container(
        color: animation.value);
  }
}

class PlaceholderBox extends StatefulWidget {
  _PlaceholderBoxState createState() => _PlaceholderBoxState();
}

class _PlaceholderBoxState extends State<PlaceholderBox>
    with SingleTickerProviderStateMixin {
  Animation<Color> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    animation = ColorTween(begin: Colors.grey[400], end: Colors.grey[200]).animate(controller)
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          controller.reverse();
        } else if (state == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return _AnimatedBox(animation: animation);
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
