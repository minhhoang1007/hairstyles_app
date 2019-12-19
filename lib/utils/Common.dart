import 'package:firebase_admob/firebase_admob.dart';

const String testDevice = 'MobileId';

class ADS {
  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    nonPersonalizedAds: true,
    keywords: <String>['Game', 'Mario'],
  );
}
