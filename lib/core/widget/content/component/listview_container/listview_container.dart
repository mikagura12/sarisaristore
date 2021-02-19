import 'package:flutter/material.dart';
import 'package:sarisaristore/core/model/paninda.dart';
import 'package:sarisaristore/core/widget/component/responsive_container/sizeinformation_model.dart';

import 'item_container/itemcontainer_widget.dart';

class CustomListView extends StatelessWidget {
  CustomListView(this.constraints, {this.products});
  final SizeInformation constraints;
  final List<Paninda> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length ?? 0,
        itemBuilder: (context, i) {
          return CustomItemContainer(
            constraints,
            product: products[i],
          );
        },
      ),
    );
  }
}
