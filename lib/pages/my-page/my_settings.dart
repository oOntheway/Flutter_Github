import 'package:flutter/material.dart';

class MySettings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Settings')
      ),
      body: Center(
        child: Text(
          'This is my setting page!'
        ),
      ),
    );
  }

}