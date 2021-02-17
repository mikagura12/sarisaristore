import 'package:flutter/material.dart';
import 'package:sarisaristore/core/widget/component/responsive_container/sizeinformation_model.dart';

import 'item_container/itemcontainer_widget.dart';

class CustomListView extends StatelessWidget {
  CustomListView(this.constraints);
  final SizeInformation constraints;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 1,
        itemBuilder: (context, i) {
          return CustomItemContainer(
            constraints,
          );
        },
      ),
    );
  }
}
