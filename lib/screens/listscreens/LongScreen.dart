import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:hairstyles_app/screens/widgets/VideoScreen.dart';
import 'package:hairstyles_app/utils/Common.dart';

class LongScreen extends StatefulWidget {
  LongScreen({Key key}) : super(key: key);

  @override
  _LongScreenState createState() => _LongScreenState();
}

class _LongScreenState extends State<LongScreen> {
  List<Itemm> items = [
    Itemm("assets/long/easy1.jpg", "assets/long/easy1.mp4"),
    Itemm("assets/long/easy2.jpg", "assets/long/easy2.mp4"),
    Itemm("assets/long/easy3.jpg", "assets/long/easy3.mp4"),
    Itemm("assets/long/easy4.jpg", "assets/long/easy4.mp4"),
    Itemm("assets/long/easy5.jpg", "assets/long/easy5.mp4"),
    Itemm("assets/long/easy6.jpg", "assets/long/easy6.mp4"),
    Itemm("assets/long/easy7.jpg", "assets/long/easy7.mp4"),
    Itemm("assets/long/easy8.jpg", "assets/long/easy8.mp4"),
    Itemm("assets/long/easy9.jpg", "assets/long/easy9.mp4"),
    Itemm("assets/long/easy10.jpg", "assets/long/easy10.mp4"),
    Itemm("assets/long/easy11.jpg", "assets/long/easy11.mp4"),
    Itemm("assets/long/easy12.jpg", "assets/long/easy12.mp4"),
    Itemm("assets/long/easy13.jpg", "assets/long/easy13.mp4"),
    Itemm("assets/long/easy14.jpg", "assets/long/easy14.mp4"),
    Itemm("assets/long/easy15.jpg", "assets/long/easy15.mp4"),
    Itemm("assets/long/easy16.jpg", "assets/long/easy16.mp4"),
  ];
  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;
  bool isLoad = false;
  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        //Change BannerAd adUnitId with Admob ID
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
      adUnitId: InterstitialAd.testAdUnitId,
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
    FirebaseAdMob.instance.initialize(appId: BannerAd.testAdUnitId);
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
