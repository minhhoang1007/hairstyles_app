import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:hairstyles_app/screens/widgets/VideoScreen.dart';

class WorkScreen extends StatefulWidget {
  WorkScreen({Key key}) : super(key: key);

  @override
  _WorkScreenState createState() => _WorkScreenState();
}

const String testDevice = 'MobileId';

class _WorkScreenState extends State<WorkScreen> {
  List<Itemm> items = [
    Itemm("assets/work/work1.jpg", "assets/work/work1.mp4"),
    Itemm("assets/work/work2.jpg", "assets/work/work2.mp4"),
    Itemm("assets/work/work3.jpg", "assets/work/work3.mp4"),
    Itemm("assets/work/work4.jpg", "assets/work/work4.mp4"),
    Itemm("assets/work/work5.jpg", "assets/work/work5.mp4"),
    Itemm("assets/work/work6.jpg", "assets/work/work6.mp4"),
    Itemm("assets/work/work7.jpg", "assets/work/work7.mp4"),
    Itemm("assets/work/work8.jpg", "assets/work/work8.mp4"),
    Itemm("assets/work/work9.jpg", "assets/work/work9.mp4"),
    Itemm("assets/work/work10.jpg", "assets/work/work10.mp4"),
    Itemm("assets/work/work11.jpg", "assets/work/work11.mp4"),
    Itemm("assets/work/work12.jpg", "assets/work/work12.mp4"),
    Itemm("assets/work/work13.jpg", "assets/work/work13.mp4"),
    Itemm("assets/work/work14.jpg", "assets/work/work14.mp4"),
    Itemm("assets/work/work15.jpg", "assets/work/work15.mp4"),
    Itemm("assets/work/work16.jpg", "assets/work/work16.mp4"),
  ];
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    nonPersonalizedAds: true,
    keywords: <String>['Game', 'Mario'],
  );
  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;
  bool isLoad = false;
  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        //Change BannerAd adUnitId with Admob ID
        size: AdSize.banner,
        targetingInfo: targetingInfo,
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
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => VideoScreen(
                  //         video: items[index].vid,
                  //       ),
                  //     ));
                },
                child: Container(
                  child: Image.asset(items[index].img),
                ),
              );
            }),
        isLoad
            ? Positioned(
                child: Container(
                  height: MediaQuery.of(context).size.height * 1,
                  width: double.infinity,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              )
            : Container(
                height: 0,
              )
      ],
    );
  }
}

class Itemm {
  String img;
  String vid;
  Itemm(this.img, this.vid);
}
