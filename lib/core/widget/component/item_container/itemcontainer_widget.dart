import 'package:flutter/material.dart';
import 'package:sarisaristore/core/constant/color.dart';
import 'package:sarisaristore/core/widget/component/responsive_container/sizeinformation_model.dart';

class CustomItemContainer extends StatelessWidget {
  CustomItemContainer(this.constraints);
  final SizeInformation constraints;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Custom Item Container'),
          Text('Height: ${constraints.height}'),
          Text('Width: ${constraints.width}'),
          Text('Oritentation: ${constraints.orientation}'),
        ],
      ),
    );
  }
}
