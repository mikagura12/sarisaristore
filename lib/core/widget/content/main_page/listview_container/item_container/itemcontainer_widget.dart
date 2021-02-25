import 'package:flutter/material.dart';
import 'package:sarisaristore/core/constant/color.dart';
import 'package:sarisaristore/core/constant/font.dart';
import 'package:sarisaristore/core/constant/icon.dart';
import 'package:sarisaristore/core/constant/string.dart';
import 'package:sarisaristore/core/model/paninda.dart';
import 'package:sarisaristore/core/widget/responsive_container/sizeinformation_model.dart';
import 'package:sarisaristore/feature/detail_page/detail_page.dart';
import 'package:sarisaristore/feature/main_page/main_model.dart';

class CustomItemContainer extends StatelessWidget {
  CustomItemContainer(this.constraints, {@required this.product, this.provide});
  final Paninda product;
  final MainModel provide;
  final SizeInformation constraints;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => _route(context),
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            width: constraints.width * .30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kContainerColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(
                  image:
                      NetworkImage('$imageDir${product.image}.png', scale: 10),
                  errorBuilder: (_, __, ___) =>
                      Image.asset('assets/images/no_image.png', scale: 10),
                ),
                Text(
                  '${product.item}',
                  overflow: TextOverflow.ellipsis,
                  style: kBigFont(
                      color: kItemTitleColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '${product.price}.00 Php',
                  style: kSmallFont(
                    color: kItemCategoryColor,
                    fontSize: 10,
                  ),
                )
              ],
            ),
          ),
        ),
        (product.isFavorite)
            ? _favoriteSwitch(kFavoriteOn)
            : _favoriteSwitch(kFavoriteOff),
      ],
    );
  }

  GestureDetector _favoriteSwitch(icon) {
    return GestureDetector(
      child: icon,
      onTap: () {
        product.isFavorite = !product.isFavorite;
      },
    );
  }

  Future _route(BuildContext context) {
    return Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => DetailPage(
          product,
          provide: provide,
        ),
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: Duration(milliseconds: 300),
      ),
    );
  }
}
