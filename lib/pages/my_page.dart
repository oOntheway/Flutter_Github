import 'package:flutter/material.dart';
import 'package:flutter_github/pages/my-page/my_info.dart';
import 'package:flutter_github/pages/my-page/my_settings.dart';

class MyPage extends StatefulWidget {

  @override
  _MyPageState createState() => _MyPageState();

}

class _MyPageState extends State<MyPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody()
    );
  }

  _buildBody() {
    return Column(
      children: <Widget>[
        myInfoArea(),
        settingsArea()
      ],
    );
  }

  myInfoArea() {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 10),
            child: Container(
              child: Icon(
                Icons.person,
                size: 70,
                color: Colors.blue,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white
              ),
            )
            
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    'Shadow Tricker',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  padding: EdgeInsets.only(bottom: 5, top: 18),
                ),
                Container(
                  child: Text(
                    'AccountName: shadow-tricker',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white
                    ),
                  ),
                  padding: EdgeInsets.only(top: 5),
                )
                
              ],
            ),
            padding: EdgeInsets.only(left: 14),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      padding: EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20)
    );
  }

  settingsArea() {
    const settingLists = ['My Info', 'My Settings'];
    return SizedBox(
      height: 400,
      child: ListView.separated(
        itemCount: settingLists.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: InkWell(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      settingLists[index],
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                  ),
                  InkWell(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
              onTap: () {
                print(settingLists[index]);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    switch (settingLists[index]) {
                      case 'My Info':
                        return MyInfo();
                      case 'My Settings':
                        return MySettings();
                      default: 
                        return null;
                    }
                  })
                );
              },
            ),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(
          height: .0,
          color: Colors.black38,
        )
      )
    );
    
  }

}