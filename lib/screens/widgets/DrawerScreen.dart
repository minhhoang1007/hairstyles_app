import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerScreen extends StatefulWidget {
  DrawerScreen({Key key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.width * 0.5,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 102, 204),
            ),
            child: DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      "assets/images/drawer.jpg",
                      height: 90,
                      width: 90,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Hairstyles step by step",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text("v 1.4",
                      style: TextStyle(color: Colors.white, fontSize: 13))
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text(
              "Rate us",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              _launchURL();
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              "More app",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              _launchURL();
            },
          ),
          ListTile(
            leading: Icon(Icons.linked_camera),
            title: Text(
              "Like us on facebook",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              _launchURL();
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text(
              "Share with friends",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text(
              "Feedback",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              _launchURL();
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text(
              "Privacy policy",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              _launchURL();
            },
          ),
        ],
      ),
    );
  }
}
