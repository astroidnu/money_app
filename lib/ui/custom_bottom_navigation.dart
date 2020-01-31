import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_app_v1/res/color_palette.dart';

class CustomBottomNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(splashColor: Colors.transparent, highlightColor: Colors.transparent),
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: ColorPalette.lightGrayishMagenta,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              title: Text("")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.show_chart),
              title: Text("")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text(""),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorPalette.richMaroon,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
}