import 'package:flutter/material.dart';
import 'package:sarisaristore/core/constant/color.dart';
import 'package:sarisaristore/core/constant/font.dart';
import 'package:sarisaristore/core/widget/component/responsive_container/sizeinformation_model.dart';

import 'component/listview_container/listview_container.dart';

class CustomContent extends StatelessWidget {
  CustomContent(this.constraints);

  final SizeInformation constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: constraints.height * .75,
      padding: EdgeInsets.only(left: 20, bottom: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Snacks',
            style: kLoraFont(
                color: kItemPriceColor,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          CustomListView(constraints),
          Text(
            'Seasonings',
            style: kLoraFont(
                color: kItemPriceColor,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          CustomListView(constraints),
          Text(
            'Others',
            style: kLoraFont(
                color: kItemPriceColor,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          CustomListView(constraints),
          Text(
            'Favorites',
            style: kLoraFont(
                color: kItemPriceColor,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          CustomListView(constraints),
        ],
      ),
    );
  }
}
