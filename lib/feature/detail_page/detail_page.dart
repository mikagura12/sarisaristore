import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarisaristore/core/constant/string.dart';
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
        return Column(
          children: [
            Image(
              image: NetworkImage(
                '$imageDir${product.image}.png',
                scale: 2,
              ),
              errorBuilder: (_, __, ___) => Image.network(
                '${imageDir}no_image.png',
                scale: 2,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('MAGIC SARAP'),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('RealPrice'),
                Text('Store Price'),
              ],
            ),
            CustomListView(
              constraints,
              products: provide.snacksCategory,
              provide: provide,
            )
          ],
        );
      },
    );
  }
}
