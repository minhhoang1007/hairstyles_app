import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:hairstyles_app/screens/widgets/VideoScreen.dart';
import 'package:hairstyles_app/utils/Common.dart';

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
  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;
  bool isLoad = false;
  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: bannerId,
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
