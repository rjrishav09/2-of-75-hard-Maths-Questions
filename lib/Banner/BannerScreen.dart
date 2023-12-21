import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {

  late final RewardedAd rewardedAd;
  final String rewardedAdUnitId = "ca-app-pub-6098110260976293/3247917193";

  late final RewardedAd rewardedAd1;
  final String rewardedAdUnitId1 = "ca-app-pub-6098110260976293/1113812098";

  @override
  void initState() {
    super.initState();
    _loadRewardedAd();
    _loadRewardedAd1();
  }

  void _loadRewardedAd(){
    RewardedAd.load(adUnitId: rewardedAdUnitId,
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
            onAdLoaded: (RewardedAd ad){
              print("$ad loaded");
              rewardedAd = ad;
              _setFullScreenContentCallback();
            },
            onAdFailedToLoad: (LoadAdError error){
              print("Failed to load rewarded ad, Error: $error");
            }));
  }
  void _setFullScreenContentCallback(){
    if(rewardedAd == null) return;
    rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) => print("$ad onAdShowFullScreenContent"),
      onAdDismissedFullScreenContent: (RewardedAd ad){
        print("$ad onAdDismissedFullScreenContent");
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error){
        print("$ad onAdFailedToShowFullScreenContent: $error");
        ad.dispose();
      },
      onAdImpression: (RewardedAd ad)=> print("$ad Impression Occured"),
    );
  }

  void _showRewardedAd(){
    rewardedAd.show(
        onUserEarnedReward: (AdWithoutView ad,RewardItem rewardItem){
          num amount = rewardItem.amount;
          print("You earned: $amount");
        });
  }

  void _loadRewardedAd1(){
    RewardedAd.load(adUnitId: rewardedAdUnitId1,
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
            onAdLoaded: (RewardedAd ad1){
              print("$ad1 loaded");
              rewardedAd1 = ad1;
              _setFullScreenContentCallback1();
            },
            onAdFailedToLoad: (LoadAdError error1){
              print("Failed to load rewarded ad, Error: $error1");
            }));
  }
  void _setFullScreenContentCallback1(){
    if(rewardedAd1 == null) return;
    rewardedAd1.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad1) => print("$ad1 onAdShowFullScreenContent"),
      onAdDismissedFullScreenContent: (RewardedAd ad1){
        print("$ad1 onAdDismissedFullScreenContent");
        ad1.dispose();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad1, AdError error1){
        print("$ad1 onAdFailedToShowFullScreenContent: $error1");
        ad1.dispose();
      },
      onAdImpression: (RewardedAd ad1)=> print("$ad1 Impression Occured"),
    );
  }
  void _showRewardedAd1(){
    rewardedAd1.show(
        onUserEarnedReward: (AdWithoutView ad1,RewardItem rewardItem){
          num amount = rewardItem.amount;
          print("You earned: $amount");
        });
  }

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*.25,
        color: Colors.cyan,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Text('WhiteHatjr',
                          style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20,),
                        SizedBox(
                          height: 45.0,
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                            child: AnimatedTextKit(
                              repeatForever: true,
                              isRepeatingAnimation: true,
                              animatedTexts: [
                                FadeAnimatedText('Reach 10 Lakh+\nIntrested Coder!'),
                                FadeAnimatedText('New way to\ncreate Apps!!'),
                                FadeAnimatedText('Over 1 Lakh+\n Users!!!'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Neumorphic(
                      style: NeumorphicStyle(
                        color: Colors.white,
                        oppositeShadowLightSource: true,
                      ),
                      child: Image.network('https://firebasestorage.googleapis.com/v0/b/whitehatjr-1a.appspot.com/o/banner%5C%2Ficons8-whitehat-jr-100.png?alt=media&token=7168e2d5-b2ee-4208-86bd-6adc7beadce4'),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: NeumorphicButton(
                    onPressed: (){_showRewardedAd();},
                    style: NeumorphicStyle(color: Colors.yellow),
                    child: Text('SPEAK',textAlign: TextAlign.center,),
                  ),),

                  SizedBox(width: 20,),
                  Expanded(child: NeumorphicButton(
                    onPressed: (){_showRewardedAd1();},
                    style: NeumorphicStyle(color: Colors.yellow),
                    child: Text('LISTEN',textAlign: TextAlign.center),
                  ),),

                ],
              )
            ],
          ),
        ),),
    );
  }
}
