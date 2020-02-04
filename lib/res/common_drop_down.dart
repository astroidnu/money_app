import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_app_v1/res/color_palette.dart';

class CommonDropdown extends StatelessWidget {
  final List<String> dropdownItems;
  final Function(String) onChange;
  final String value;

  CommonDropdown(
      {Key key,
      @required this.value,
      @required this.dropdownItems,
      @required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: ColorPalette.freshAir),
        child: DropdownButtonHideUnderline(
          key: Key('ddLooksLike'),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButton(
              value: value,
              items: _buildDropDownItems(dropdownItems),
              onChanged: onChange,
              hint: Text("Select your latest education"),
            ),
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDropDownItems(List<String> items) {
    return items
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ))
        .toList();
  }
}
