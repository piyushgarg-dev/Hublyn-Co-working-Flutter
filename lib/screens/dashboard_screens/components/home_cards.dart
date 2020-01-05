import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {

  final userPic;
  final userName;
  final bannerUrl;
  final caption;

  HomeCard({this.userPic,this.userName,this.bannerUrl,this.caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(userPic!=null?userPic:' ',),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(userName!=null?userName:' ',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  )
                ],
              ),

            ),
            caption!=null? Padding(
              padding: const EdgeInsets.only(top:8.0,bottom: 10.0,left: 15.0),
              child: Container(
                child: Text(caption,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20.0,color: Colors.grey),
                ),
              ),
            ):Container(),
            bannerUrl!=null?Image(image: NetworkImage(bannerUrl),) : Container()
          ],
        ),
      ),
    );
  }
}
