import 'package:flutter/material.dart';
import 'package:sarisaristore/core/model/paninda.dart';
import 'package:sarisaristore/core/widget/responsive_container/sizeinformation_model.dart';
import 'package:sarisaristore/feature/main_page/main_model.dart';

import 'item_container/itemcontainer_widget.dart';

class CustomListView extends StatelessWidget {
  CustomListView(this.constraints, {this.products, this.provide});
  final SizeInformation constraints;
  final List<Paninda> products;
  final MainModel provide;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length ?? 0,
        itemBuilder: (context, i) {
          return CustomItemContainer(
            constraints,
            provide: provide,
            product: products[i],
          );
        },
      ),
    );
  }
}
