import 'package:flutter/material.dart';
import 'package:sarisaristore/core/constant/color.dart';
import 'package:sarisaristore/core/constant/font.dart';
import 'package:sarisaristore/core/model/paninda.dart';
import 'package:sarisaristore/core/widget/component/responsive_container/sizeinformation_model.dart';

class CustomItemContainer extends StatelessWidget {
  CustomItemContainer(this.constraints, {@required this.item});
  final Paninda item;

  final SizeInformation constraints;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      width: constraints.width * .30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kContainerColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            'assets/images/potato_fries.png',
            scale: 10,
          ),
          Text(
            '${item.item}',
            style: kLoraFont(
                color: kItemTitleColor,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          Text(
            '${item.price}.00 Php',
            style: kMontserratFont(
              color: kItemCategoryColor,
              fontSize: 10,
            ),
          )
        ],
      ),
    );
  }
}
