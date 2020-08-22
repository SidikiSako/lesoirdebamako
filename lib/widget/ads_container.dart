import 'package:flutter/material.dart';

class AdsContainer extends StatefulWidget {
  @override
  _AdsContainerState createState() => _AdsContainerState();
}

class _AdsContainerState extends State<AdsContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'PUBLICITÉ',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
      width: double.infinity,
      height: 30.0,
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.grey,
      )),
    );
  }
}
