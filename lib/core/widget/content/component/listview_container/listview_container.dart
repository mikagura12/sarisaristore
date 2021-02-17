import 'package:flutter/material.dart';
import 'package:sarisaristore/core/model/paninda.dart';
import 'package:sarisaristore/core/widget/component/responsive_container/sizeinformation_model.dart';

import 'item_container/itemcontainer_widget.dart';

class CustomListView extends StatelessWidget {
  CustomListView(this.constraints, {this.items});
  final SizeInformation constraints;
  final List<Paninda> items;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length ?? 0,
        itemBuilder: (context, i) {
          return CustomItemContainer(
            constraints,
            item: items[i],
          );
        },
      ),
    );
  }
}
