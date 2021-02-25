import 'package:flutter/material.dart';
import 'package:sarisaristore/core/constant/color.dart';
import 'package:sarisaristore/core/constant/font.dart';
import 'package:sarisaristore/core/widget/responsive_container/sizeinformation_model.dart';
import 'package:sarisaristore/feature/main_page/main_model.dart';
import 'main_page/listview_container/listview_container.dart';

class CustomContent extends StatefulWidget {
  CustomContent(this.constraints, {@required this.provide});
  final MainModel provide;
  final SizeInformation constraints;

  @override
  _CustomContentState createState() => _CustomContentState();
}

class _CustomContentState extends State<CustomContent> with ChangeNotifier {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.constraints.height * .75,
      padding: EdgeInsets.only(bottom: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Text(
            title: 'Snacks',
          ),
          CustomListView(
            widget.constraints,
            products: widget.provide.snacksCategory,
            provide: widget.provide,
          ),
          _Text(
            title: 'Coffee\'s',
          ),
          CustomListView(
            widget.constraints,
            products: widget.provide.coffeeCategory,
            provide: widget.provide,
          ),
          _Text(
            title: 'Others',
          ),
          CustomListView(
            widget.constraints,
            products: widget.provide.othersCategory,
            provide: widget.provide,
          ),
          _Text(
            title: 'Favorite\'s',
          ),
          CustomListView(
            widget.constraints,
            products: widget.provide.isFavorite,
            provide: widget.provide,
          ),
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
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Text(
        '$title',
        style: kBigFont(
            color: kItemPriceColor, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
