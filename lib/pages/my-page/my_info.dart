import 'package:flutter/material.dart';

class MyInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Info')
      ),
      body: Center(
        child: Text(
          'This is my info page!'
        ),
      ),
    );
  }

}