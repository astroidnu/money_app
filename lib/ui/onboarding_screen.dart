import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:money_app_v1/di/injector.dart';
import 'package:money_app_v1/model/onboarding_data.dart';
import 'package:money_app_v1/res/color_palette.dart';
import 'package:money_app_v1/util/routes.dart';

import 'onboarding_item_screen.dart';

class OnboardingScreen extends StatefulWidget {
  final List<OnboardingData> onboardingList = [
    OnboardingData(
        imageResource: "assets/images/icon_hamburger.png",
        title: "On Boarding 1",
        description:
        "1. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
    OnboardingData(
        imageResource: "assets/images/icon_otw.png",
        title: "On Boarding 2",
        description:
        "2. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
    OnboardingData(
        imageResource: "assets/images/icon_search.png",
        title: "On Boarding 3",
        description:
        "3. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
    OnboardingData(
        imageResource: "assets/images/icon_hamburger.png",
        title: "On Boarding 4",
        description:
        "4. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
  ];

  @override
  State<StatefulWidget> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final FirebaseAnalytics analytics = Injector.resolve<FirebaseAnalytics>();
  SwiperController swiperController = SwiperController();
  int position = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Swiper.children(
            index: position,
            loop: false,
            controller: swiperController,
            onIndexChanged: (newIndex) {
              setState(() {
                position = newIndex;
                sendEventAnalytics("open_onboarding_$newIndex");
              });
            },
            pagination: SwiperPagination(
                margin: EdgeInsets.only(bottom: 20),
                builder: DotSwiperPaginationBuilder(
                  color: ColorPalette.bubbles,
                  activeColor: ColorPalette.richMaroon,
                  size: 10,
                  activeSize: 12,
                )),
            control: SwiperControl(
              iconNext: null,
              iconPrevious: null,
            ),
            children: _buildOnboardingChildren(widget.onboardingList),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 20),
              child: Container(
                  padding: EdgeInsets.all(4),
                  child: GestureDetector(
                    onTap: () {
                      if (position != widget.onboardingList.length - 1) {
                        position = widget.onboardingList.length - 1;
                        skipIntro();
                      } else {
                        Navigator.pushReplacementNamed(context, LoginRoute);
                      }
                    },
                    child: Text(
                      position == widget.onboardingList.length - 1
                          ? "Mulai"
                          : "Skip",
                      style: TextStyle(
                          color: ColorPalette.bubbles,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      key: Key('txtSkipStart'),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildOnboardingChildren(List<OnboardingData> onboardingData) {
    List<Widget> onboardingChildren = [];
    onboardingChildren = onboardingData
        .map((item) => OnboardingItemScreen(
              onboardingData: item,
            ))
        .toList();

    return onboardingChildren;
  }

  void skipIntro() async {
    await swiperController.move(position);
  }

  Future<void> sendEventAnalytics(String message) async{
    await analytics.logEvent(name: message);

  }
}
