import 'package:flutter/material.dart';
import 'package:hairstyles_app/screens/widgets/VideoScreen.dart';

class PartyScreen extends StatefulWidget {
  PartyScreen({Key key}) : super(key: key);

  @override
  _PartyScreenState createState() => _PartyScreenState();
}

class _PartyScreenState extends State<PartyScreen> {
  List<Itemm> items = [
    Itemm("assets/party/party1.jpg", "assets/party/party1.mp4"),
    Itemm("assets/party/party2.jpg", "assets/party/party2.mp4"),
    Itemm("assets/party/party3.jpg", "assets/party/party3.mp4"),
    Itemm("assets/party/party4.jpg", "assets/party/party4.mp4"),
    Itemm("assets/party/party5.jpg", "assets/party/party5.mp4"),
    Itemm("assets/party/party6.jpg", "assets/party/party6.mp4"),
    Itemm("assets/party/party7.jpg", "assets/party/party7.mp4"),
    Itemm("assets/party/party8.jpg", "assets/party/party8.mp4"),
    Itemm("assets/party/party9.jpg", "assets/party/party9.mp4"),
    Itemm("assets/party/party10.jpg", "assets/party/party10.mp4"),
    Itemm("assets/party/party11.jpg", "assets/party/party11.mp4"),
    Itemm("assets/party/party12.jpg", "assets/party/party12.mp4"),
    Itemm("assets/party/party13.jpg", "assets/party/party13.mp4"),
    Itemm("assets/party/party14.jpg", "assets/party/party14.mp4"),
    Itemm("assets/party/party15.jpg", "assets/party/party15.mp4"),
    Itemm("assets/party/party16.jpg", "assets/party/party16.mp4"),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = size.height * 0.5;
    final double itemWidth = size.width * 0.7;
    return GridView.builder(
        itemCount: items.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: itemWidth / itemHeight),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoScreen(
                      video: items[index].vid,
                    ),
                  ));
            },
            child: Container(
              child: Image.asset(items[index].img),
            ),
          );
        });
  }
}

class Itemm {
  String img;
  String vid;
  Itemm(this.img, this.vid);
}
