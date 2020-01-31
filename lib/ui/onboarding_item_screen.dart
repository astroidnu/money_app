import 'package:flutter/widgets.dart';
import 'package:money_app_v1/model/onboarding_data.dart';
import 'package:money_app_v1/res/color_palette.dart';

class OnboardingItemScreen extends StatelessWidget {
  final OnboardingData onboardingData;

  OnboardingItemScreen({Key key, @required this.onboardingData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[ColorPalette.bubbles, ColorPalette.lightGrayishMagenta]),
      ),
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            onboardingData.imageResource,
            height: 200,
          ),
          SizedBox(
            height: 100,
          ),
          Center(
            child: Text(
              onboardingData.title,
              style: TextStyle(
                  color: ColorPalette.bubbles,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height / 20),
            child: Text(
              onboardingData.description,
              style: TextStyle(
                color: ColorPalette.bubbles,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
