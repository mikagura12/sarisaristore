import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarisaristore/core/constant/color.dart';
import 'package:sarisaristore/core/constant/font.dart';
import 'package:sarisaristore/core/model/paninda.dart';
import 'package:sarisaristore/core/widget/component/responsive_container/sizeinformation_model.dart';
import 'package:sarisaristore/feature/main_page/main_model.dart';

import 'component/listview_container/listview_container.dart';

class CustomContent extends StatefulWidget {
  CustomContent(this.constraints, {@required this.provide});
  final MainModel provide;
  final SizeInformation constraints;

  @override
  _CustomContentState createState() => _CustomContentState();
}

class _CustomContentState extends State<CustomContent> with ChangeNotifier {
  //Separating The Category
  filtering() {
    for (var item in widget.provide.tempSearch) {
      widget.provide.categoryFilter(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    filtering();
    return Container(
      height: widget.constraints.height * .75,
      padding: EdgeInsets.only(left: 20, bottom: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Text(
            title: 'Products',
          ),
          CustomListView(
            widget.constraints,
            products: widget.provide.tempSearch,
          ),
          /*   _Text(
            title: 'Coffee\'s',
          ),
          CustomListView(
            widget.constraints,
            products: widget.provide.coffeeCategory,
          ),
          _Text(
            title: 'Others',
          ),
          CustomListView(
            widget.constraints,
            products: widget.provide.othersCategory,
          ),
          _Text(
            title: 'Favorites',
          ),
          CustomListView(
            widget.constraints,
            products: widget.provide.isFavorite,
          ), */
        ],
      ),
    );
  }
}

class _Text extends StatelessWidget {
  _Text({this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$title',
      style: kLoraFont(
          color: kItemPriceColor, fontSize: 15, fontWeight: FontWeight.bold),
    );
  }
}
