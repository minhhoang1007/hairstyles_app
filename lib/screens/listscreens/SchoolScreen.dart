import 'package:flutter/material.dart';
import 'package:hairstyles_app/screens/widgets/VideoScreen.dart';

class SchoolScreen extends StatefulWidget {
  SchoolScreen({Key key}) : super(key: key);

  @override
  _SchoolScreenState createState() => _SchoolScreenState();
}

class _SchoolScreenState extends State<SchoolScreen> {
  List<Itemm> items = [
    Itemm("assets/school/school1.jpg", "assets/school/school1.mp4"),
    Itemm("assets/school/school2.jpg", "assets/school/school2.mp4"),
    Itemm("assets/school/school3.jpg", "assets/school/school3.mp4"),
    Itemm("assets/school/school4.jpg", "assets/school/school4.mp4"),
    Itemm("assets/school/school5.jpg", "assets/school/school5.mp4"),
    Itemm("assets/school/school6.jpg", "assets/school/school6.mp4"),
    Itemm("assets/school/school7.jpg", "assets/school/school7.mp4"),
    Itemm("assets/school/school8.jpg", "assets/school/school8.mp4"),
    Itemm("assets/school/school9.jpg", "assets/school/school9.mp4"),
    Itemm("assets/school/school10.jpg", "assets/school/school10.mp4"),
    Itemm("assets/school/school11.jpg", "assets/school/school11.mp4"),
    Itemm("assets/school/school12.jpg", "assets/school/school12.mp4"),
    Itemm("assets/school/school13.jpg", "assets/school/school13.mp4"),
    Itemm("assets/school/school14.jpg", "assets/school/school14.mp4"),
    Itemm("assets/school/school15.jpg", "assets/school/school15.mp4"),
    Itemm("assets/school/school16.jpg", "assets/school/school16.mp4"),
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
