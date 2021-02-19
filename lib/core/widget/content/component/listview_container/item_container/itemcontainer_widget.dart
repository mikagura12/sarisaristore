import 'package:flutter/material.dart';
import 'package:sarisaristore/core/constant/color.dart';
import 'package:sarisaristore/core/constant/font.dart';
import 'package:sarisaristore/core/constant/icon.dart';
import 'package:sarisaristore/core/constant/string.dart';
import 'package:sarisaristore/core/model/paninda.dart';
import 'package:sarisaristore/core/widget/component/responsive_container/sizeinformation_model.dart';

class CustomItemContainer extends StatelessWidget {
  CustomItemContainer(this.constraints, {@required this.product});
  final Paninda product;

  final SizeInformation constraints;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          width: constraints.width * .30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kContainerColor,
          ),
          child: Column(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image(
                    image: NetworkImage('$imageDir${product.image}.png',
                        scale: 10),
                    errorBuilder: (_, __, ___) =>
                        Image.network('${imageDir}no_image.png', scale: 10),
                  ),
                  Text(
                    '${product.item}',
                    overflow: TextOverflow.ellipsis,
                    style: kLoraFont(
                        color: kItemTitleColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${product.price}.00 Php',
                    style: kMontserratFont(
                      color: kItemCategoryColor,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        (product.isFavorite)
            ? _favoriteSwitch(kFavoriteOn)
            : _favoriteSwitch(kFavoriteOff),
      ],
    );
  }

  GestureDetector _favoriteSwitch(icon) {
    return GestureDetector(
      child: icon,
      onTap: () {
        product.isFavorite = !product.isFavorite;
      },
    );
  }
}
