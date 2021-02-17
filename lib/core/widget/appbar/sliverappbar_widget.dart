import 'package:flutter/material.dart';
import 'package:sarisaristore/core/widget/component/responsive_container/sizeinformation_model.dart';

import 'component/searchbar_widget.dart';

class CustomSliverAppBar extends StatelessWidget {
  final SizeInformation constraints;

  CustomSliverAppBar(this.constraints);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Image.asset(
          'assets/images/sliverappbar.jpg',
          width: constraints.width,
          height: constraints.height * .25,
          fit: BoxFit.cover,
        ),
        Positioned(
          child: CustomSearchBar(constraints),
          bottom: -15,
          left: (constraints.width * .15),
        ),
      ],
    );
  }
}
