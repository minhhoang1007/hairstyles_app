import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:hairstyles_app/screens/widgets/VideoScreen.dart';

class SchoolScreen extends StatefulWidget {
  SchoolScreen({Key key}) : super(key: key);

  @override
  _SchoolScreenState createState() => _SchoolScreenState();
}

const String testDevice = 'MobileId';

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
