import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_app_v1/res/color_palette.dart';

class WalletScreen extends StatelessWidget {
  final String payload;

  WalletScreen({Key key, this.payload}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wallet"),),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorPalette.bubbles,
              ColorPalette.freshAir
            ]
          ),
        ),
        child: Column(
          children: <Widget>[
            Text("Isi payload adalah : "),
            Text(payload),
          ],
        ),
      ),
    );
  }
}