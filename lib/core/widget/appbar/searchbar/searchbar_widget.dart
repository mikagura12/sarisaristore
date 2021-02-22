import 'package:flutter/material.dart';
import 'package:sarisaristore/core/constant/color.dart';
import 'package:sarisaristore/core/constant/font.dart';

import 'package:sarisaristore/core/constant/icon.dart';
import 'package:sarisaristore/core/widget/responsive_container/sizeinformation_model.dart';

class CustomSearchBar extends StatelessWidget {
  CustomSearchBar(this.constraints, {this.onChanged});
  final Function(String searchText) onChanged;
  final SizeInformation constraints;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: constraints.width * .75,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: Offset.fromDirection(1.9, 2),
            color: Colors.grey,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: kSearchIcon,
          border: InputBorder.none,
          hintStyle: kMontserratFont(color: kItemCategoryColor),
          hintText: 'Find Items...',
        ),
      ),
    );
  }
}
