import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarisaristore/core/constant/color.dart';
import 'package:sarisaristore/core/constant/font.dart';
import 'package:sarisaristore/core/model/paninda.dart';
import 'package:sarisaristore/core/widget/component/responsive_container/sizeinformation_model.dart';
import 'package:sarisaristore/feature/main_page/main_model.dart';

import 'component/listview_container/listview_container.dart';

class CustomContent extends StatefulWidget {
  CustomContent(this.constraints, {@required this.items});
  final List<Paninda> items;
  final SizeInformation constraints;

  @override
  _CustomContentState createState() => _CustomContentState();
}

class _CustomContentState extends State<CustomContent> {
  MainModel provide;

  @override
  void didChangeDependencies() {
    provide = Provider.of<MainModel>(context);
    filtering();
    super.didChangeDependencies();
  }

  //Separating The Category
  filtering() {
    for (var item in widget.items) {
      provide.categoryFilter(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.constraints.height * .75,
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
          CustomListView(
            widget.constraints,
            items: provide.snacksCategory,
          ),
          Text(
            'Seasonings',
            style: kLoraFont(
                color: kItemPriceColor,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          CustomListView(
            widget.constraints,
            items: provide.seasoningsCategory,
          ),
          Text(
            'Others',
            style: kLoraFont(
                color: kItemPriceColor,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          CustomListView(widget.constraints, items: provide.othersCategory),
          Text(
            'Favorites',
            style: kLoraFont(
                color: kItemPriceColor,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          CustomListView(
            widget.constraints,
            items: provide.isFavorite,
          ),
        ],
      ),
    );
  }
}
