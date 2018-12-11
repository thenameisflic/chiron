import 'package:flutter/material.dart';
import 'placeholder_box_widget.dart';

class PlaceHeader extends StatelessWidget {
  final String name;
  final String streetAddress;
  final String neighborhood;
  final String city;
  final String state;
  final String imageUrl;

  PlaceHeader({this.name, this.streetAddress, this.neighborhood, this.imageUrl, this.city, this.state});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 12.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    this.name,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                ),
                Text(
                  "${this.streetAddress} - ${this.neighborhood}",
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  "${this.city}, ${this.state}",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          new Container(
              width: 80.0,
              height: 80.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(4.0),
                  image: new DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: new NetworkImage(
                          "https://igx.4sqi.net/img/general/200x200/44296737_5xL4EGuz2tY9rHnaWcXhMWtECkztX49R_P6-tFx1adc.jpg")))),
        ],
      ),
    );
  }
}

class PlaceholderPlaceHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 12.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 4.0),
                  height: 18,
                  width: 140,
                  child: PlaceholderBox(),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 4.0),
                  height: 14,
                  width: 180,
                  child: PlaceholderBox(),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 4.0),
                  height: 14,
                  width: 80,
                  child: PlaceholderBox(),
                ),
              ],
            ),
          ),
          new Container(
              width: 80.0,
              height: 80.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.grey[200]
                  )),
        ],
      ),
    );
  }
}
