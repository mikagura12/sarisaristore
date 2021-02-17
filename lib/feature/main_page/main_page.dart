import 'package:flutter/material.dart';
import 'package:sarisaristore/core/widget/appbar/sliverappbar_widget.dart';
import 'package:sarisaristore/core/widget/component/responsive_container/responsive_widget.dart';
import 'package:sarisaristore/core/widget/content/content_container.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomResponsive(
      builder: (context, constraints) {
        double tfive = constraints.height * .25;
        double sfive = constraints.height * .75;
        print('25% $tfive');
        print('75%  $sfive');
        print('Total: ${tfive + sfive}');
        print('\nHeight: ${constraints.height}');

        return Container(
          child: Column(
            children: [
              Column(
                children: [
                  CustomSliverAppBar(constraints),
                  CustomContent(constraints)
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
