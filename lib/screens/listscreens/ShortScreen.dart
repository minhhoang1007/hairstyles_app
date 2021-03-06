import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:hairstyles_app/screens/widgets/VideoScreen.dart';
import 'package:hairstyles_app/utils/Common.dart';
import 'package:hairstyles_app/utils/Common.dart' as prefix0;

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
  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;
  bool isLoad = false;
  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: bannerId,
        size: AdSize.banner,
        targetingInfo: ADS().targetingInfo,
        listener: (MobileAdEvent event) {
          print("BannerAd $event");
        });
  }

  void getAd(item) async {
    setState(() {
      isLoad = true;
    });
    _interstitialAd = InterstitialAd(
      adUnitId: interUnitId,
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.closed) {
          _interstitialAd.load();
        }
        handEvent(event, item);
      },
    );
    _interstitialAd.load();
  }

  void handEvent(MobileAdEvent event, item) {
    switch (event) {
      case MobileAdEvent.loaded:
        _interstitialAd.show();

        break;
      case MobileAdEvent.opened:
        break;
      case MobileAdEvent.closed:
        isLoad = false;
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoScreen(
                video: item,
              ),
            ));
        break;
      case MobileAdEvent.failedToLoad:
        isLoad = false;
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoScreen(
                video: item,
              ),
            ));

        break;
      default:
    }
  }

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: appId);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = size.height * 0.5;
    final double itemWidth = size.width * 0.7;
    return Stack(
      children: <Widget>[
        GridView.builder(
            itemCount: items.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: itemWidth / itemHeight),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  getAd(items[index].vid);
                },
                child: Container(
                  child: Image.asset(items[index].img),
                ),
              );
            }),
        isLoad
            ? Positioned(
                child: Container(
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              )
            : Container(
                height: 0,
              ),
      ],
    );
  }
}

class Itemm {
  String img;
  String vid;
  Itemm(this.img, this.vid);
}
