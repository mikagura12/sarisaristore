import 'package:flutter/material.dart';
import 'package:sarisaristore/core/widget/component/item_container/itemcontainer_widget.dart';
import 'package:sarisaristore/core/widget/component/responsive_container/responsive_widget.dart';

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
              Container(
                height: constraints.height * .25,
                color: Colors.red,
              ),
              Container(
                color: Colors.blue,
                height: constraints.height * .75,
              ),
            ],
          ),
        );
      },
    );
  }
}
