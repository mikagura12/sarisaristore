import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sarisaristore/core/constant/color.dart';
import 'package:sarisaristore/core/constant/font.dart';
import 'package:sarisaristore/core/constant/string.dart';
import 'package:sarisaristore/core/constant/icon.dart';
import 'package:sarisaristore/core/model/paninda.dart';
import 'package:sarisaristore/core/widget/content/main_page/listview_container/listview_container.dart';
import 'package:sarisaristore/core/widget/responsive_container/responsive_widget.dart';
import 'package:sarisaristore/feature/main_page/main_model.dart';

class DetailPage extends StatelessWidget {
  DetailPage(this.product, {this.provide});
  final MainModel provide;
  final Paninda product;
  @override
  Widget build(BuildContext context) {
    return CustomResponsive(
      builder: (context, constraints) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: kBackHome,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Image(
                      image: NetworkImage(
                        '$imageDir${product.image}.png',
                        scale: 2,
                      ),
                      errorBuilder: (_, __, ___) => Image.asset(
                        'assets/images/no_image.png',
                        scale: 2,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${product.item}',
                      style: kBigFont(
                          color: kItemPriceColor, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'RealPrice',
                              style: kBigFont(
                                  color: kItemPriceColor, fontSize: 20),
                            ),
                            Text(
                              '${product.prevPrice ?? product.price}.00 Php',
                              style: kSmallFont(color: Colors.grey),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Store Price',
                              style: kBigFont(
                                  color: kItemPriceColor, fontSize: 20),
                            ),
                            Text(
                              '${product.price}.00 Php',
                              style: kSmallFont(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Favorite\'s',
                  style: kBigFont(
                    color: kItemPriceColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomListView(
                constraints,
                products: provide.isFavorite,
                provide: provide,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'You may also like',
                  style: kBigFont(
                    color: kItemPriceColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomListView(
                constraints,
                products: provide.othersCategory,
                provide: provide,
              )
            ],
          ),
        );
      },
    );
  }
}
