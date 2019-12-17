import 'package:flutter/material.dart';
import 'package:hairstyles_app/screens/widgets/VideoScreen.dart';

class ShortScreen extends StatefulWidget {
  ShortScreen({Key key}) : super(key: key);

  @override
  _ShortScreenState createState() => _ShortScreenState();
}

class _ShortScreenState extends State<ShortScreen> {
  List<Itemm> items = [
    Itemm("assets/short/short1.jpg", "assets/short/short1.mp4"),
    Itemm("assets/short/short2.jpg", "assets/short/short2.mp4"),
    Itemm("assets/short/short3.jpg", "assets/short/short3.mp4"),
    Itemm("assets/short/short4.jpg", "assets/short/short4.mp4"),
    Itemm("assets/short/short5.jpg", "assets/short/short5.mp4"),
    Itemm("assets/short/short6.jpg", "assets/short/short6.mp4"),
    Itemm("assets/short/short7.jpg", "assets/short/short7.mp4"),
    Itemm("assets/short/short8.jpg", "assets/short/short8.mp4"),
    Itemm("assets/short/short9.jpg", "assets/short/short9.mp4"),
    Itemm("assets/short/short10.jpg", "assets/short/short10.mp4"),
    Itemm("assets/short/short11.jpg", "assets/short/short11.mp4"),
    Itemm("assets/short/short12.jpg", "assets/short/short12.mp4"),
    Itemm("assets/short/short13.jpg", "assets/short/short13.mp4"),
    Itemm("assets/short/short14.jpg", "assets/short/short14.mp4"),
    Itemm("assets/short/short15.jpg", "assets/short/short15.mp4"),
    Itemm("assets/short/short16.jpg", "assets/short/short16.mp4"),
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
