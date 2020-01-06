import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeCard extends StatelessWidget {

  final userPic;
  final userName;
  final bannerUrl;
  final caption;
  final userEmail;
  final time;

  HomeCard({this.time,this.userPic,this.userName,this.bannerUrl,this.caption,this.userEmail});

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
                    child: Column(
                      children: <Widget>[
                        Text(userName!=null?userName:' ',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(height: 8.0,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(time!=null?time:'',style: TextStyle(color: Colors.grey),),
                        )
                      ],
                    ),
                  )
                ],
              ),

            ),
            caption!=null? Padding(
              padding: const EdgeInsets.only(top:8.0,bottom: 10.0,left: 15.0,right: 15.0),
              child: Container(
                child: Text(caption,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20.0,color: Colors.blue,fontFamily: 'roboto'),
                ),
              ),
            ):Container(),
            Padding(
              padding: const EdgeInsets.only(left: 35.0,right: 35.0),
              child: Divider(
                thickness: 2.0,
              ),
            ),
            FlatButton(
              onPressed: (){
                String url = 'mailto:$userEmail?subject=[ Hublyn ] In reply to your posted requirements&body=$caption\n';
                launch(url);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('CONTACT'),
                  SizedBox(width: 10.0,),
                  Icon(Icons.email,color: Colors.blue,)
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
