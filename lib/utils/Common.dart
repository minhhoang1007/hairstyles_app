import 'package:firebase_admob/firebase_admob.dart';

const String testDevice = 'MobileId';
const String appId = 'ca-app-pub-3940256099942544/1033173712';
const String interUnitId = "ca-app-pub-5695244063993443/2500471844";

class ADS {
  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    nonPersonalizedAds: true,
    keywords: <String>['Game', 'Mario'],
  );
}
